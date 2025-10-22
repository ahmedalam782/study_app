import 'package:json_annotation/json_annotation.dart';
part 'subcategory.g.dart';

@JsonSerializable()
class Subcategory {
  Subcategory();

  factory Subcategory.fromJson(Map<String, dynamic> json) =>
      _$SubcategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);
}
