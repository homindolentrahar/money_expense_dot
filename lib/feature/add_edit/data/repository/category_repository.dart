import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:money_expense_dot/core/data/local/app_database.dart';
import 'package:money_expense_dot/core/domain/model/category_model.dart';
import 'package:money_expense_dot/feature/add_edit/domain/repository/i_category_repository.dart';

class CategoryRepository implements ICategoryRepository {
  final AppDatabase database;

  CategoryRepository(this.database);

  @override
  Future<Either<String, List<CategoryModel>>> getAllCategories() async {
    try {
      final result = await database.select(database.categories).get();

      return right(
        result
            .map(
              (e) => CategoryModel(
                icon: e.icon,
                outIcon: e.outIcon,
                slug: e.slug,
                name: e.name,
              ),
            )
            .toList(),
      );
    } catch (e) {
      log("Error: ${e.toString()}");
      return left(e.toString());
    }
  }
}
