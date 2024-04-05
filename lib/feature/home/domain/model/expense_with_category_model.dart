import 'package:money_expense_dot/core/domain/model/expense_category_model.dart';
import 'package:money_expense_dot/core/domain/model/expense_model.dart';

class ExpenseWithCategoryModel {
  final ExpenseModel expense;
  final ExpenseCategoryModel category;

  ExpenseWithCategoryModel({required this.expense, required this.category});
}
