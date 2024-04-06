import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_expense_dot/core/base_status.dart';
import 'package:money_expense_dot/feature/home/domain/model/expense_with_category_model.dart';

part 'add_edit_state.freezed.dart';

@freezed
class AddEditState with _$AddEditState {
  const factory AddEditState({
    @Default(null) ExpenseWithCategoryModel? data,
    @Default("") String message,
    @Default(false) bool isFormValid,
    @Default(BaseStatus.initial) BaseStatus status,
  }) = _AddEditState;

  factory AddEditState.initial({ExpenseWithCategoryModel? data}) =>
      AddEditState(status: BaseStatus.initial, data: data);

  factory AddEditState.loading() =>
      const AddEditState(status: BaseStatus.loading);
}
