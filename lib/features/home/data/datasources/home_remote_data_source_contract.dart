import 'package:study_app/core/config/base_response/result.dart';
import 'package:study_app/features/home/data/models/categories_model/category.dart';
import 'package:study_app/features/home/data/models/products_model/product.dart';

abstract class HomeRemoteDataSourceContract {
  Future<Result<List<Product>>> getProducts();
  Future<Result<List<Category>>> getCategories();
}
