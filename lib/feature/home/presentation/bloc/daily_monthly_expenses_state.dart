import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_monthly_expenses_state.freezed.dart';

@freezed
class DailyMonthlyExpensesState with _$DailyMonthlyExpensesState {
  const factory DailyMonthlyExpensesState.initial() = _Initial;
  const factory DailyMonthlyExpensesState.loading() = _Loading;
  const factory DailyMonthlyExpensesState.success(Map<String, double> data) =
      _Success;
  const factory DailyMonthlyExpensesState.error(String error) = _Error;
}
