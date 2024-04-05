import 'package:money_expense_dot/core/domain/model/expense_category_constant.dart';
import 'package:money_expense_dot/core/domain/model/expense_model.dart';

class ExpenseWithCategoryModel {
  final ExpenseModel expense;
  final ExpenseCategoryModel category;

  ExpenseWithCategoryModel({required this.expense, required this.category});
}
