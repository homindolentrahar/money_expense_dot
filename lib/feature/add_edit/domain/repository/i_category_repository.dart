import 'package:dartz/dartz.dart';
import 'package:money_expense_dot/core/domain/model/category_model.dart';

abstract interface class ICategoryRepository {
  Future<Either<String, List<CategoryModel>>> getAllCategories();
}
