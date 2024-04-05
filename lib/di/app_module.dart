import 'package:get_it/get_it.dart';
import 'package:money_expense_dot/core/data/local/app_database.dart';
import 'package:money_expense_dot/feature/add_edit/data/repository/crud_expense_repository.dart';
import 'package:money_expense_dot/feature/add_edit/domain/repository/i_crud_expense_repository.dart';
import 'package:money_expense_dot/feature/home/data/repository/expenses_repository.dart';
import 'package:money_expense_dot/feature/home/domain/repository/i_expenses_repository.dart';

final injector = GetIt.instance;

abstract class AppModule {
  static Future<void> inject() async {
    injector.registerLazySingleton<AppDatabase>(() => AppDatabase());
    injector.registerFactory<IExpenseRepository>(
      () => ExpensesRepository(injector.get<AppDatabase>()),
    );
    injector.registerFactory<ICrudExpenseRepository>(
      () => CrudExpenseRepository(injector.get<AppDatabase>()),
    );
  }
}
