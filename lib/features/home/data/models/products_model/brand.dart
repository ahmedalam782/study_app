import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'brand.g.dart';
@JsonSerializable()
class Brand extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const Brand({this.id, this.name, this.slug, this.image});
  factory Brand.fromJson(Map<String, dynamic> json) =>
      _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);

  Brand copyWith({String? id, String? name, String? slug, String? image}) {
    return Brand(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [id, name, slug, image];
}
