import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_expense_dot/feature/home/domain/model/expense_with_category_model.dart';
import 'package:money_expense_dot/util/extension/double_ext.dart';

class ExpenseListItem extends StatelessWidget {
  final ExpenseWithCategoryModel data;
  final ValueChanged<ExpenseWithCategoryModel> onPressed;

  const ExpenseListItem({
    super.key,
    required this.data,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(data),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 14,
        ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(data.category.outIcon, width: 24, height: 24),
                const SizedBox(width: 14),
                Text(
                  data.expense.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
            Text(
              data.expense.amount.formatCurrency(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
