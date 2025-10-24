import 'package:injectable/injectable.dart';
import 'package:study_app/core/config/base_response/result.dart';
import 'package:study_app/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:study_app/features/home/domain/entities/categories_entity.dart';
import 'package:study_app/features/home/domain/entities/products_entity.dart';
import 'package:study_app/features/home/domain/repositories/home_repositories.dart';

@Injectable(as: HomeRepositories)
class HomeRepositoriesImp implements HomeRepositories {
  final HomeRemoteDataSourceContract remoteDataSource;

  HomeRepositoriesImp({required this.remoteDataSource});

  @override
  Future<Result<List<ProductsEntity>>> fetchProducts() async {
    final result = await remoteDataSource.getProducts();
    switch (result) {
      case Success():
        final entities = result.data
            ?.map<ProductsEntity>((product) => product.toEntity())
            .toList();
        return Success(data: entities);
      case Error():
        return Error(exception: result.exception);
    }
  }

  @override
  Future<Result<List<CategoriesEntity>>> fetchCategories() async {
    final result = await remoteDataSource.getCategories();
    switch (result) {
      case Success():
        final entities = result.data
            ?.map<CategoriesEntity>((category) => category.toEntity())
            .toList();
        return Success(data: entities);
      case Error():
        return Error(exception: result.exception);
    }
  }
}
