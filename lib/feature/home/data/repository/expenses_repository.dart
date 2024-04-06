import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:money_expense_dot/core/data/local/app_database.dart';
import 'package:money_expense_dot/core/domain/model/category_model.dart';
import 'package:money_expense_dot/core/domain/model/expense_model.dart';
import 'package:money_expense_dot/feature/home/domain/model/expense_with_category_model.dart';
import 'package:money_expense_dot/feature/home/domain/repository/i_expenses_repository.dart';

class ExpensesRepository implements IExpenseRepository {
  final AppDatabase database;

  ExpensesRepository(this.database);

  @override
  Stream<Either<String, Map<DateTime, List<ExpenseWithCategoryModel>>>>
      watchAllExpenses() async* {
    final query = database.select(database.expenses).join([
      innerJoin(
        database.categories,
        database.categories.slug.equalsExp(database.expenses.category),
      ),
    ]);

    yield* query.watch().map((rows) {
      final expensesWithModel = rows
          .map(
            (row) {
              final data = row.rawData.data;
              return ExpenseWithCategoryModel(
                expense: ExpenseModel(
                  id: data['expenses.id'],
                  name: data['expenses.name'],
                  category: data['expenses.category'],
                  amount: data['expenses.amount'],
                  expensedAt:
                      DateTime.parse(data['expenses.expensed_at']).toLocal(),
                ),
                category: CategoryModel(
                  icon: data['categories.icon'],
                  outIcon: data['categories.out_icon'],
                  slug: data['categories.slug'],
                  name: data['categories.name'],
                ),
              );
            },
          )
          .sorted(
            (a, b) => b.expense.expensedAt.compareTo(a.expense.expensedAt),
          )
          .toList();
      final Map<DateTime, List<ExpenseWithCategoryModel>> grouppedByDate =
          expensesWithModel.groupListsBy(
        (element) => element.expense.expensedAt,
      );

      return right<String, Map<DateTime, List<ExpenseWithCategoryModel>>>(
          grouppedByDate);
    }).onErrorReturnWith(
      (error, stackTrace) {
        log("Error: ${error.toString()}");
        return left(error.toString());
      },
    );
  }

  @override
  Stream<Either<String, Map<String, double>>>
      watchDailyMonthlyExpenses() async* {
    final current = DateTime.now();
    final query = database.select(database.expenses);
    final today = DateTime(current.year, current.month, current.day);
    final thisMonth = DateTime(current.year, current.month);

    yield* query.watch().map(
      (rows) {
        final daily = rows.where((e) => e.expensedAt == today).fold(
              0.0,
              (previousValue, element) => previousValue += element.amount,
            );
        final monthly = rows
            .where(
              (e) =>
                  e.expensedAt.year == thisMonth.year &&
                  e.expensedAt.month == thisMonth.month,
            )
            .fold(
              0.0,
              (previousValue, element) => previousValue += element.amount,
            );

        log("Daily: $monthly");

        return right<String, Map<String, double>>({
          'daily': daily,
          'monthly': monthly,
        });
      },
    ).onErrorReturnWith(
      (error, stackTrace) {
        return left(error.toString());
      },
    );
  }

  @override
  Stream<Either<String, Map<CategoryModel, double>>> watchExpensesByCategory() {
    // TODO: implement watchExpensesByCategory
    throw UnimplementedError();
  }
}
