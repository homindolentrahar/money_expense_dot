import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_expense_dot/di/app_module.dart';
import 'package:money_expense_dot/feature/home/domain/repository/i_expenses_repository.dart';
import 'package:money_expense_dot/feature/home/presentation/bloc/expenses_state.dart';
import 'package:rxdart/rxdart.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(const ExpensesState.initial()) {
    repository.watchAllExpenses().doOnListen(() {
      emit(const ExpensesState.loading());
    }).listen((either) {
      either.fold(
        (error) => emit(ExpensesState.error(error.toString())),
        (data) {
          emit(ExpensesState.success(data));
        },
      );
    });
  }

  final IExpenseRepository repository = injector.get<IExpenseRepository>();
}
