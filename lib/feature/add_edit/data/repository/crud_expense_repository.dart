import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:money_expense_dot/core/data/local/app_database.dart';
import 'package:money_expense_dot/core/domain/model/expense_model.dart';
import 'package:money_expense_dot/feature/add_edit/domain/repository/i_crud_expense_repository.dart';

class CrudExpenseRepository implements ICrudExpenseRepository {
  final AppDatabase database;

  CrudExpenseRepository(this.database);

  @override
  Future<Either<String, Unit>> createExpense(ExpenseModel data) async {
    try {
      final companion = ExpensesCompanion(
        name: Value(data.name),
        amount: Value(data.amount),
        expensedAt: Value(data.expensedAt),
        category: Value(data.category),
      );

      await database.into(database.expenses).insert(companion);

      return right(unit);
    } catch (e) {
      log("Error: ${e.toString()}");
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteExpense(int id) async {
    try {
      await (database.delete(database.expenses)
            ..where((tbl) => tbl.id.equals(id)))
          .go();

      return right(unit);
    } catch (e) {
      log("Error: ${e.toString()}");
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> updateExpense({
    required int id,
    required ExpenseModel data,
  }) async {
    try {
      final companion = ExpensesCompanion(
        name: Value(data.name),
        amount: Value(data.amount),
        expensedAt: Value(data.expensedAt),
        category: Value(data.category),
      );

      await (database.update(database.expenses)
            ..where((tbl) => tbl.id.equals(id)))
          .write(companion);

      return right(unit);
    } catch (e) {
      log("Error: ${e.toString()}");
      return left(e.toString());
    }
  }
}
