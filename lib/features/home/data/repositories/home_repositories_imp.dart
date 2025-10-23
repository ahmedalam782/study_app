import 'package:injectable/injectable.dart';
import 'package:study_app/core/config/api/api_executer.dart';
import 'package:study_app/core/config/base_response/result.dart';
import 'package:study_app/core/network/network_info.dart';
import 'package:study_app/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:study_app/features/home/domain/entities/categories_entity.dart';
import 'package:study_app/features/home/domain/entities/products_entity.dart';
import 'package:study_app/features/home/domain/repositories/home_repositories.dart';

@Injectable(as: HomeRepositories)
class HomeRepositoriesImp implements HomeRepositories {
  final HomeRemoteDataSourceContract remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoriesImp({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Result<List<ProductsEntity>>> fetchProducts() async {
    return executeApi(() async {
      final products = await remoteDataSource.getProducts();
      final entities = products.map((product) => product.toEntity()).toList();
      return entities;
    }, networkInfo);
  }

  @override
  Future<Result<List<CategoriesEntity>>> fetchCategories() async {
    return executeApi(() async {
      final categories = await remoteDataSource.getCategories();
      final entities = categories
          .map((category) => category.toEntity())
          .toList();
      return entities;
    }, networkInfo);
  }
}
