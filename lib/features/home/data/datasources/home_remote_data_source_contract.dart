import 'package:study_app/features/home/data/models/categories_model/category.dart';
import 'package:study_app/features/home/data/models/products_model/products_model.dart';

abstract class HomeRemoteDataSourceContract {
  Future<List<ProductsModel>> getProducts();
  Future<List<Category>> getCategories();
}
