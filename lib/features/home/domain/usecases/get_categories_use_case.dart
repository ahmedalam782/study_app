
import 'package:study_app/features/home/data/models/categories_model/category.dart';
import 'package:study_app/features/home/domain/repositories/home_repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  final HomeRepositories repository;

  GetCategoriesUseCase({required this.repository});

  Future<List<Category>> call() async {
    return await repository.fetchCategories();
  }
}
