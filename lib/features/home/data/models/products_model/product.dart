import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:study_app/features/home/domain/entities/products_entity.dart';

import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int? sold;
  final List<String>? images;
  final List<Subcategory>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final Category? category;
  final Brand? brand;
  final double? ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? priceAfterDiscount;
  final List<dynamic>? availableColors;

  const Product({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.priceAfterDiscount,
    this.availableColors,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
  Product copyWith({
    int? sold,
    List<String>? images,
    List<Subcategory>? subcategory,
    int? ratingsQuantity,
    String? id,
    String? title,
    String? slug,
    String? description,
    int? quantity,
    int? price,
    String? imageCover,
    Category? category,
    Brand? brand,
    double? ratingsAverage,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? priceAfterDiscount,
    List<dynamic>? availableColors,
  }) {
    return Product(
      sold: sold ?? this.sold,
      images: images ?? this.images,
      subcategory: subcategory ?? this.subcategory,
      ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imageCover: imageCover ?? this.imageCover,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      ratingsAverage: ratingsAverage ?? this.ratingsAverage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
      availableColors: availableColors ?? this.availableColors,
    );
  }

  @override
  List<Object?> get props {
    return [
      sold,
      images,
      subcategory,
      ratingsQuantity,
      id,
      title,
      slug,
      description,
      quantity,
      price,
      imageCover,
      category,
      brand,
      ratingsAverage,
      createdAt,
      updatedAt,
      priceAfterDiscount,
      availableColors,
    ];
  }

  ProductsEntity toEntity() {
    return ProductsEntity(
      name: title ?? '',
      description: description ?? '',
      price: price?.toDouble() ?? 0.0,
    );
  }
}
