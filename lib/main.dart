import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:money_expense_dot/core/presentation/app_theme.dart';
import 'package:money_expense_dot/di/app_module.dart';
import 'package:money_expense_dot/route/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppModule.inject();

  runApp(const MoneyExpenseApp());
}

class MoneyExpenseApp extends StatelessWidget {
  const MoneyExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Money Expense DOT',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRoute.router,
      builder: EasyLoading.init(),
    );
  }
}
