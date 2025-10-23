import 'package:study_app/features/home/data/models/products_model/product.dart';

class ProductsEntity {
  final String name;
  final String description;
  final double price;

  ProductsEntity({
    required this.name,
    required this.description,
    required this.price,
  });

  Product toModel() {
    return Product(title: name, description: description, price: price.toInt());
  }
}
