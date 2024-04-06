import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_expense_dot/core/domain/model/category_model.dart';

part 'expenses_by_category_state.freezed.dart';

@freezed
class ExpensesByCategoryState with _$ExpensesByCategoryState {
  const factory ExpensesByCategoryState.initial() = _Initial;
  const factory ExpensesByCategoryState.loading() = _Loading;
  const factory ExpensesByCategoryState.success(
      Map<CategoryModel, double> data) = _Success;
  const factory ExpensesByCategoryState.error(String error) = _Error;
}
