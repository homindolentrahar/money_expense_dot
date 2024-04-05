import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_expense_dot/feature/home/domain/model/expense_with_category_model.dart';

part 'expenses_state.freezed.dart';

@freezed
class ExpensesState with _$ExpensesState {
  const factory ExpensesState.initial() = _Initial;
  const factory ExpensesState.loading() = _Loading;
  const factory ExpensesState.success(
    Map<DateTime, List<ExpenseWithCategoryModel>> datas,
  ) = _Success;
  const factory ExpensesState.error(String error) = _Error;
}
