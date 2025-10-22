import 'package:injectable/injectable.dart';
import 'package:study_app/features/home/data/models/products_model/products_model.dart';
import 'package:study_app/features/home/domain/repositories/home_repositories.dart';

@injectable
class GetProductsUseCase {
  final HomeRepositories homeRepositories;

  GetProductsUseCase(this.homeRepositories);

  Future<List<ProductsModel>> call() async {
    return await homeRepositories.fetchProducts();
  }
}
