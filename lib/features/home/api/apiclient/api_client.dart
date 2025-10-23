import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:study_app/features/home/data/models/categories_model/category.dart';
import 'package:study_app/features/home/data/models/products_model/product.dart';
part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/products')
  Future<List<Product>> getProducts();

  @GET('/categories')
  Future<List<Category>> getCategories();
}
