import 'package:equatable/equatable.dart';

import 'product.dart';
import 'pagination_result.dart';

import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel extends Equatable {
  final int? results;
  final PaginationResult? metadata;
  final List<Product>? data;

  const ProductsModel({this.results, this.metadata, this.data});

  
  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);

  ProductsModel copyWith({
    int? results,
    PaginationResult? metadata,
    List<Product>? data,
  }) {
    return ProductsModel(
      results: results ?? this.results,
      metadata: metadata ?? this.metadata,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [results, metadata, data];
}
