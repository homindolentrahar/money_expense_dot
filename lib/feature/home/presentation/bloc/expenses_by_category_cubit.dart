import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_expense_dot/di/app_module.dart';
import 'package:money_expense_dot/feature/home/domain/repository/i_expenses_repository.dart';
import 'package:money_expense_dot/feature/home/presentation/bloc/expenses_by_category_state.dart';
import 'package:rxdart/rxdart.dart';

class ExpensesByCategoryCubit extends Cubit<ExpensesByCategoryState> {
  ExpensesByCategoryCubit() : super(const ExpensesByCategoryState.initial()) {
    repository.watchExpensesByCategory().doOnListen(() {
      emit(const ExpensesByCategoryState.loading());
    }).listen((either) {
      either.fold(
        (error) {
          emit(ExpensesByCategoryState.error(error));
        },
        (data) => emit(ExpensesByCategoryState.success(data)),
      );
    });
  }

  final IExpenseRepository repository = injector.get<IExpenseRepository>();
}
