import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pagination_result.g.dart';

@JsonSerializable()
class PaginationResult extends Equatable {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  const PaginationResult({this.currentPage, this.numberOfPages, this.limit});

  factory PaginationResult.fromJson(Map<String, dynamic> json) =>
      _$PaginationResultFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationResultToJson(this);

  PaginationResult copyWith({
    int? currentPage,
    int? numberOfPages,
    int? limit,
  }) {
    return PaginationResult(
      currentPage: currentPage ?? this.currentPage,
      numberOfPages: numberOfPages ?? this.numberOfPages,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [currentPage, numberOfPages, limit];
}
