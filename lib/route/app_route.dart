import 'package:go_router/go_router.dart';
import 'package:money_expense_dot/feature/add_edit/presentation/add_edit_page.dart';
import 'package:money_expense_dot/feature/home/presentation/home_page.dart';

abstract class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.initial,
    routes: [
      GoRoute(
        path: RoutePaths.initial,
        builder: (ctx, state) => const HomePage(),
      ),
      GoRoute(
        path: RoutePaths.add,
        builder: (ctx, state) => const AddEditPage(),
      ),
      GoRoute(
        path: "${RoutePaths.expense}/:id",
        builder: (ctx, state) => const AddEditPage(),
      ),
    ],
  );
}

abstract class RoutePaths {
  static const String initial = "/";
  static const String add = "/add";
  static const String expense = "/expense";
}
