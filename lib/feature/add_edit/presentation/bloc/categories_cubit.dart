import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_expense_dot/core/domain/model/category_model.dart';
import 'package:money_expense_dot/di/app_module.dart';
import 'package:money_expense_dot/feature/add_edit/domain/repository/i_category_repository.dart';

class CategoriesCubit extends Cubit<List<CategoryModel>> {
  CategoriesCubit() : super([]) {
    loadCategories();
  }

  final ICategoryRepository repository = injector.get<ICategoryRepository>();

  Future<void> loadCategories() async {
    final result = await repository.getAllCategories();

    result.fold(
      (error) {
        log("Error: ${error.toString()}");
        emit(state);
      },
      (datas) {
        emit(datas);
      },
    );
  }
}
