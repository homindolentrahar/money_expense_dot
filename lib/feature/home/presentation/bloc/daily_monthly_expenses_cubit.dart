import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_expense_dot/di/app_module.dart';
import 'package:money_expense_dot/feature/home/domain/repository/i_expenses_repository.dart';
import 'package:money_expense_dot/feature/home/presentation/bloc/daily_monthly_expenses_state.dart';
import 'package:rxdart/rxdart.dart';

class DailyMonthlyExpensesCubit extends Cubit<DailyMonthlyExpensesState> {
  DailyMonthlyExpensesCubit()
      : super(const DailyMonthlyExpensesState.initial()) {
    repository.watchDailyMonthlyExpenses().doOnListen(() {
      emit(const DailyMonthlyExpensesState.loading());
    }).listen((either) {
      either.fold(
        (error) {
          emit(DailyMonthlyExpensesState.error(error));
        },
        (data) => emit(DailyMonthlyExpensesState.success(data)),
      );
    });
  }

  final IExpenseRepository repository = injector.get<IExpenseRepository>();
}
