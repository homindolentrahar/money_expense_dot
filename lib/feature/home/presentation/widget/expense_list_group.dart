import 'package:flutter/material.dart';
import 'package:money_expense_dot/feature/home/domain/model/expense_with_category_model.dart';
import 'package:money_expense_dot/feature/home/presentation/widget/expense_list_item.dart';
import 'package:money_expense_dot/util/extension/datetime_ext.dart';

class ExpenseListGroup extends StatelessWidget {
  final Map<DateTime, List<ExpenseWithCategoryModel>> datas;

  const ExpenseListGroup({
    super.key,
    required this.datas,
  });

  String get groupDate {
    final current = DateTime.now();

    if (current.isToday) {
      return "Hari Ini";
    } else if (current.isYesterday) {
      return "Kemarin";
    } else {
      return current.formatDate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: datas.length,
      separatorBuilder: (_, index) => const SizedBox(height: 28),
      itemBuilder: (ctx, index) {
        final date = datas.keys.toList()[index];
        final expenses = datas.values.toList()[index];
        String groupDate = date.formatDate(pattern: "dd MMM yyy");

        if (date.isToday) {
          groupDate = "Hari Ini";
        } else if (date.isYesterday) {
          groupDate = "Kemarin";
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              groupDate,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: expenses.length,
              separatorBuilder: (_, index) => const SizedBox(height: 20),
              itemBuilder: (ctx, index) => ExpenseListItem(
                data: expenses[index],
              ),
            ),
          ],
        );
      },
    );
  }
}
