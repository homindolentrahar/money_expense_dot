import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense_dot/core/domain/model/expense_category_constant.dart';
import 'package:money_expense_dot/feature/home/presentation/widget/expense_banner_item.dart';
import 'package:money_expense_dot/feature/home/presentation/widget/expense_category_item.dart';
import 'package:money_expense_dot/feature/home/presentation/widget/expense_list_group.dart';
import 'package:money_expense_dot/route/app_route.dart';
import 'package:money_expense_dot/util/constant/dummy_datas.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: SvgPicture.asset("assets/icons/ic_add.svg"),
        onPressed: () {
          context.push(RoutePaths.add);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Halo, User!",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Jangan lupa catat keuanganmu setiap hari!",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                          child: ExpenseBannerItem(
                            expenseType: ExpenseBannerType.daily,
                            expenseAmount: 10000,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ExpenseBannerItem(
                            expenseType: ExpenseBannerType.monthly,
                            expenseAmount: 200000,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Pengeluaran berdasarkan kategori",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(20).copyWith(bottom: 28),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 20,
                  children: List.generate(
                    ExpenseCategoryConstant.categories.length,
                    (index) {
                      return ExpenseCategoryItem(
                        amount: 100000,
                        category: ExpenseCategoryConstant.categories[index],
                      );
                    },
                  ),
                ),
              ),
              ExpenseListGroup(
                datas: DummyDatas.dummyGrouppedExpensesWithCategory,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
