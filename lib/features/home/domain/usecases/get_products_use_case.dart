import 'package:injectable/injectable.dart';
import 'package:study_app/core/config/base_response/result.dart';
import 'package:study_app/features/home/domain/entities/products_entity.dart';
import 'package:study_app/features/home/domain/repositories/home_repositories.dart';

@injectable
class GetProductsUseCase {
  final HomeRepositories homeRepositories;

  GetProductsUseCase(this.homeRepositories);

  Future<Result<List<ProductsEntity>>> call() async {
    return await homeRepositories.fetchProducts();
  }
}
