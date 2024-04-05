import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_expense_dot/core/domain/model/expense_category_constant.dart';
import 'package:money_expense_dot/util/extension/double_ext.dart';

class ExpenseCategoryItem extends StatelessWidget {
  final ExpenseCategoryModel category;
  final double amount;

  const ExpenseCategoryItem({
    super.key,
    required this.amount,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(16).copyWith(bottom: 18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 4,
            offset: const Offset(0, 4),
            color: const Color(0xFF000000).withOpacity(0.08),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(category.icon, width: 36, height: 36),
          const SizedBox(height: 12),
          Text(
            category.name,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Text(
            amount.formatCurrency(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
