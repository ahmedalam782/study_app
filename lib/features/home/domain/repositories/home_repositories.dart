import 'package:study_app/features/home/data/models/products_model/products_model.dart';
import 'package:study_app/features/home/data/models/categories_model/category.dart';

abstract class HomeRepositories {
  Future<List<ProductsModel>> fetchProducts();
  Future<List<Category>> fetchCategories();
}