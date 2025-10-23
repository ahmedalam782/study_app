import 'package:study_app/core/config/base_response/result.dart';
import 'package:study_app/features/home/domain/entities/categories_entity.dart';
import 'package:study_app/features/home/domain/entities/products_entity.dart';

abstract class HomeRepositories {
  Future<Result<List<ProductsEntity>>> fetchProducts();
  Future<Result<List<CategoriesEntity>>> fetchCategories();
}
