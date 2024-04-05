import 'package:flutter/material.dart';
import 'package:money_expense_dot/feature/home/presentation/home_page.dart';

void main() {
  runApp(const MoneyExpenseApp());
}

class MoneyExpenseApp extends StatelessWidget {
  const MoneyExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Money Expense DOT',
      home: HomePage(),
    );
  }
}
