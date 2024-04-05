import 'package:collection/collection.dart';
import 'package:money_expense_dot/core/domain/model/category_model.dart';
import 'package:money_expense_dot/core/domain/model/expense_model.dart';
import 'package:money_expense_dot/feature/home/domain/model/expense_with_category_model.dart';

abstract class DummyDatas {
  static final DateTime _now = DateTime.now();
  static final DateTime dummyCurrentDate = DateTime(
    _now.year,
    _now.month,
    _now.day,
  );
  static final List<ExpenseModel> dummyExpenses = [
    ExpenseModel(
      id: 0,
      name: "Dummy 1",
      category: CategoryModel.of("makanan")?.slug ?? "",
      amount: 100000,
      expensedAt: dummyCurrentDate,
    ),
    ExpenseModel(
      id: 1,
      name: "Dummy 2",
      category: CategoryModel.of("internet")?.slug ?? "",
      amount: 220000,
      expensedAt: dummyCurrentDate.subtract(const Duration(days: 1)),
    ),
    ExpenseModel(
      id: 2,
      name: "Dummy 3",
      category: CategoryModel.of("hiburan")?.slug ?? "",
      amount: 100000,
      expensedAt: dummyCurrentDate.subtract(const Duration(days: 1)),
    ),
    ExpenseModel(
      id: 3,
      name: "Dummy 4",
      category: CategoryModel.of("transport")?.slug ?? "",
      amount: 1000,
      expensedAt: dummyCurrentDate.subtract(const Duration(days: 2)),
    ),
    ExpenseModel(
      id: 4,
      name: "Dummy 5",
      category: CategoryModel.of("makanan")?.slug ?? "",
      amount: 100000,
      expensedAt: dummyCurrentDate.subtract(const Duration(days: 2)),
    ),
    ExpenseModel(
      id: 5,
      name: "Dummy 6",
      category: CategoryModel.of("alat_rumah")?.slug ?? "",
      amount: 100000,
      expensedAt: dummyCurrentDate.subtract(const Duration(days: 3)),
    ),
  ];
  static final List<ExpenseWithCategoryModel> dummyExpensesWithModel =
      dummyExpenses
          .map(
            (e) => ExpenseWithCategoryModel(
              expense: e,
              category: CategoryConstant.categories.first,
            ),
          )
          .toList();
  static final Map<DateTime, List<ExpenseWithCategoryModel>>
      dummyGrouppedExpensesWithCategory = dummyExpensesWithModel
          .groupListsBy((element) => element.expense.expensedAt);
}
