import 'package:study_app/features/home/data/models/categories_model/category.dart';
import 'package:study_app/features/home/data/models/products_model/product.dart';

abstract class HomeRemoteDataSourceContract {
  Future<List<Product>> getProducts();
  Future<List<Category>> getCategories();
}
