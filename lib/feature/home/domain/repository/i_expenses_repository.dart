import 'package:dartz/dartz.dart';
import 'package:money_expense_dot/core/domain/model/category_model.dart';
import 'package:money_expense_dot/feature/home/domain/model/expense_with_category_model.dart';

abstract interface class IExpenseRepository {
  Stream<Either<String, Map<DateTime, List<ExpenseWithCategoryModel>>>>
      watchAllExpenses();

  Stream<Either<String, Map<String, double>>> watchDailyMonthlyExpenses();

  Stream<Either<String, Map<CategoryModel, double>>> watchExpensesByCategory();
}
