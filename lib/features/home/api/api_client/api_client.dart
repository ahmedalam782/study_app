import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:study_app/core/config/api/end_points.dart';
import 'package:study_app/features/home/data/models/categories_model/categories_model.dart';
import 'package:study_app/features/home/data/models/products_model/products_model.dart';
part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(EndPoints.products)
  Future<ProductsModel> getProducts();

  @GET(EndPoints.categories)
  Future<CategoriesModel> getCategories(
    
  );
}
