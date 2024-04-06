import 'package:flutter/material.dart';
import 'package:money_expense_dot/core/presentation/app_color.dart';
import 'package:money_expense_dot/util/extension/double_ext.dart';

enum ExpenseBannerType {
  monthly("Pengeluaranmu bulan ini"),
  daily("Pengeluaranmu hari ini");

  final String title;

  const ExpenseBannerType(this.title);
}

extension ExpenseBannerTypeExt on ExpenseBannerType {
  Color get color {
    switch (this) {
      case ExpenseBannerType.daily:
        return AppColor.primary;
      case ExpenseBannerType.monthly:
        return AppColor.secondary;
      default:
        return Colors.transparent;
    }
  }
}

class ExpenseBannerItem extends StatelessWidget {
  final ExpenseBannerType expenseType;
  final double expenseAmount;

  const ExpenseBannerItem({
    super.key,
    required this.expenseType,
    required this.expenseAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14).copyWith(
        bottom: 10,
        right: 28,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: expenseType.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expenseType.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 14),
          Text(
            expenseAmount.formatCurrency(),
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
