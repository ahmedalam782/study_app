
import 'package:study_app/features/home/data/models/products_model/category.dart';

class CategoriesEntity {
  final String? name;
  final String? imageUrl;

  CategoriesEntity({
    required this.name,
    this.imageUrl,
  });


  Category toModel() {
    return Category(
      name: name,
      image: imageUrl,
    );
  }
}