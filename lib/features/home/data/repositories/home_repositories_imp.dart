
import 'package:injectable/injectable.dart';
import 'package:study_app/features/home/data/datasources/home_remote_data_source_contract.dart';
import 'package:study_app/features/home/data/models/categories_model/category.dart';
import 'package:study_app/features/home/data/models/products_model/products_model.dart';
import 'package:study_app/features/home/domain/repositories/home_repositories.dart';
@Injectable(as: HomeRepositories)
class HomeRepositoriesImp implements HomeRepositories {
  final HomeRemoteDataSourceContract remoteDataSource;

  HomeRepositoriesImp({required this.remoteDataSource});

  @override
  Future<List<ProductsModel>> fetchProducts() async {
    return await remoteDataSource.getProducts();
  }

  @override
  Future<List<Category>> fetchCategories() async {
    return await remoteDataSource.getCategories();
  }
}
