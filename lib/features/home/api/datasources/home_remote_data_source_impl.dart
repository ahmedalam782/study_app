import 'package:injectable/injectable.dart';
import 'package:study_app/features/home/api/apiclient/api_client.dart';
import 'package:study_app/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:study_app/features/home/data/models/categories_model/category.dart';
import 'package:study_app/features/home/data/models/products_model/product.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  final ApiClient apiClient;
  HomeRemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<List<Category>> getCategories() async {
    final result = await apiClient.getCategories();
    return result;
  }

  @override
  Future<List<Product>> getProducts() async {
    final result = await apiClient.getProducts();
    return result;
  }
}

    
