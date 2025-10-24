import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:study_app/features/home/domain/entities/products_entity.dart';

import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  @JsonKey(name: 'sold')
  final int? sold;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'subcategory')
  final List<Subcategory>? subcategory;
  @JsonKey(name: 'ratingsQuantity')
  final int? ratingsQuantity;
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'quantity')
  final int? quantity;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'imageCover')
  final String? imageCover;
  @JsonKey(name: 'category')
  final Category? category;
  @JsonKey(name: 'brand')
  final Brand? brand;
  @JsonKey(name: 'ratingsAverage')
  final double? ratingsAverage;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;
  @JsonKey(name: 'priceAfterDiscount')
  final int? priceAfterDiscount;
  @JsonKey(name: 'availableColors')
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
