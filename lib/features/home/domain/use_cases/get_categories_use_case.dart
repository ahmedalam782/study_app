
import 'package:study_app/core/config/base_response/result.dart';
import 'package:study_app/features/home/domain/entities/categories_entity.dart';
import 'package:study_app/features/home/domain/repositories/home_repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  final HomeRepositories repository;

  GetCategoriesUseCase({required this.repository});

  Future<Result<List<CategoriesEntity>>> call() async {
    return await repository.fetchCategories();
  }
}
