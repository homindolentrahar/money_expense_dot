import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense_dot/feature/home/presentation/bloc/daily_monthly_expenses_cubit.dart';
import 'package:money_expense_dot/feature/home/presentation/bloc/daily_monthly_expenses_state.dart';
import 'package:money_expense_dot/feature/home/presentation/bloc/expenses_by_category_cubit.dart';
import 'package:money_expense_dot/feature/home/presentation/bloc/expenses_by_category_state.dart';
import 'package:money_expense_dot/feature/home/presentation/bloc/expenses_cubit.dart';
import 'package:money_expense_dot/feature/home/presentation/bloc/expenses_state.dart';
import 'package:money_expense_dot/feature/home/presentation/widget/expense_banner_item.dart';
import 'package:money_expense_dot/feature/home/presentation/widget/expense_category_item.dart';
import 'package:money_expense_dot/feature/home/presentation/widget/expense_list_group.dart';
import 'package:money_expense_dot/route/app_route.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage._();

  static Widget getPage() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ExpensesCubit()),
        BlocProvider(create: (_) => DailyMonthlyExpensesCubit()),
        BlocProvider(create: (_) => ExpensesByCategoryCubit()),
      ],
      child: const ExpensesPage._(),
    );
  }

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
                    BlocBuilder<DailyMonthlyExpensesCubit,
                        DailyMonthlyExpensesState>(
                      builder: (_, state) {
                        return state.maybeWhen(
                          success: (data) {
                            return Row(
                              children: [
                                Expanded(
                                  child: ExpenseBannerItem(
                                    expenseType: ExpenseBannerType.daily,
                                    expenseAmount: data['daily'] ?? 0,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: ExpenseBannerItem(
                                    expenseType: ExpenseBannerType.monthly,
                                    expenseAmount: data['monthly'] ?? 0,
                                  ),
                                ),
                              ],
                            );
                          },
                          orElse: () => const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularProgressIndicator(),
                              CircularProgressIndicator(),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Pengeluaran berdasarkan kategori",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
              BlocBuilder<ExpensesByCategoryCubit, ExpensesByCategoryState>(
                  builder: (_, state) {
                return state.maybeWhen(
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  success: (data) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(20).copyWith(bottom: 28),
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 20,
                      children: List.generate(
                        data.length,
                        (index) {
                          return ExpenseCategoryItem(
                            amount: data.values.toList()[index],
                            category: data.keys.toList()[index],
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),
              BlocBuilder<ExpensesCubit, ExpensesState>(
                builder: (_, state) {
                  return state.maybeWhen(
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    success: (data) => ExpenseListGroup(datas: data),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
