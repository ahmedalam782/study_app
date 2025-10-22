import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:study_app/features/home/data/models/categories_model/pagination_result.dart';

import 'category.dart';
part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel extends Equatable {
  final int? results;
  final PaginationResult? metadata;
  final List<Category>? data;

  const CategoriesModel({this.results, this.metadata, this.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

  CategoriesModel copyWith({
    int? results,
    PaginationResult? metadata,
    List<Category>? data,
  }) {
    return CategoriesModel(
      results: results ?? this.results,
      metadata: metadata ?? this.metadata,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [results, metadata, data];
}
