import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:money_expense_dot/core/base_status.dart';
import 'package:money_expense_dot/core/domain/model/expense_model.dart';
import 'package:money_expense_dot/di/app_module.dart';
import 'package:money_expense_dot/feature/add_edit/domain/repository/i_crud_expense_repository.dart';
import 'package:money_expense_dot/feature/add_edit/presentation/bloc/add_edit_state.dart';

class AddEditCubit extends Cubit<AddEditState> {
  AddEditCubit({ExpenseModel? data}) : super(AddEditState(data: data));

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
    final result = await _repository.createExpense(model);

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
}
