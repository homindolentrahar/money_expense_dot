import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:money_expense_dot/core/base_status.dart';
import 'package:money_expense_dot/core/domain/model/expense_model.dart';
import 'package:money_expense_dot/di/app_module.dart';
import 'package:money_expense_dot/feature/add_edit/domain/repository/i_crud_expense_repository.dart';
import 'package:money_expense_dot/feature/add_edit/presentation/bloc/add_edit_state.dart';
import 'package:money_expense_dot/feature/home/domain/model/expense_with_category_model.dart';

class AddEditCubit extends Cubit<AddEditState> {
  AddEditCubit({ExpenseWithCategoryModel? initialData})
      : super(AddEditState.initial(data: initialData));

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final ICrudExpenseRepository _repository =
      injector.get<ICrudExpenseRepository>();

  void onFormChanged() {
    emit(
      state.copyWith(
        status: BaseStatus.initial,
        isFormValid:
            formKey.currentState?.saveAndValidate(focusOnInvalid: false) ??
                false,
      ),
    );
  }

  void submit() async {
    emit(state.copyWith(status: BaseStatus.loading));

    final formValue = formKey.currentState?.value ?? {};
    final model = ExpenseModel.fromJson(formValue);
    final result = state.data != null
        ? await _repository.updateExpense(
            id: state.data?.expense.id ?? -1,
            data: model,
          )
        : await _repository.createExpense(model);

    log("Form: $formValue");

    result.fold(
      (error) {
        emit(state.copyWith(
          status: BaseStatus.error,
          message: error,
        ));
      },
      (_) {
        emit(state.copyWith(
          status: BaseStatus.success,
          message: "",
          isFormValid: false,
        ));
      },
    );
  }

  void delete() async {
    emit(state.copyWith(status: BaseStatus.loading));

    final result = await _repository.deleteExpense(
      state.data?.expense.id ?? -1,
    );

    result.fold(
      (error) {
        emit(state.copyWith(
          status: BaseStatus.error,
          message: error,
        ));
      },
      (_) {
        emit(state.copyWith(
          status: BaseStatus.success,
          message: "",
          isFormValid: false,
        ));
      },
    );
  }
}
