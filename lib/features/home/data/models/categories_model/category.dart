import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:study_app/features/home/domain/entities/categories_entity.dart';
part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    String? id,
    String? name,
    String? slug,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [id, name, slug, image, createdAt, updatedAt];
  }

  CategoriesEntity toEntity() {
    return CategoriesEntity(name: name, imageUrl: image);
  }
}
