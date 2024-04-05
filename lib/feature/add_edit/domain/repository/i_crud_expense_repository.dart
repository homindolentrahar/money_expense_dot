import 'package:dartz/dartz.dart';
import 'package:money_expense_dot/core/domain/model/expense_model.dart';

abstract interface class ICrudExpenseRepository {
  Future<Either<String, Unit>> createExpense(ExpenseModel data);
  Future<Either<String, Unit>> updateExpense({
    required int id,
    required ExpenseModel data,
  });
  Future<Either<String, Unit>> deleteExpense(int id);
}
