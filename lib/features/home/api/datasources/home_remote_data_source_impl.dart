import 'package:injectable/injectable.dart';
import 'package:study_app/core/config/api/api_executer.dart';
import 'package:study_app/core/config/base_response/result.dart';
import 'package:study_app/features/home/api/api_client/api_client.dart';
import 'package:study_app/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:study_app/features/home/data/models/categories_model/category.dart';
import 'package:study_app/features/home/data/models/products_model/product.dart';

@Injectable(as: HomeRemoteDataSourceContract)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  final ApiClient apiClient;
  HomeRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<Result<List<Category>>> getCategories() async {
    return await executeApi<List<Category>>(() async {
      final categories = await apiClient.getCategories();
      return categories.data ?? [];
    });
  }

  @override
  Future<Result<List<Product>>> getProducts() async {
    return await executeApi<List<Product>>(() async {
      final products = await apiClient.getProducts();
      return products.data ?? [];
    });
  }
}
