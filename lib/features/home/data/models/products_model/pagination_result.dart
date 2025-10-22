import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pagination_result.g.dart';

@JsonSerializable()
class PaginationResult extends Equatable {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;
  final int? nextPage;

  const PaginationResult({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory PaginationResult.fromJson(Map<String, dynamic> json) =>
      _$PaginationResultFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationResultToJson(this);

  PaginationResult copyWith({
    int? currentPage,
    int? numberOfPages,
    int? limit,
    int? nextPage,
  }) {
    return PaginationResult(
      currentPage: currentPage ?? this.currentPage,
      numberOfPages: numberOfPages ?? this.numberOfPages,
      limit: limit ?? this.limit,
      nextPage: nextPage ?? this.nextPage,
    );
  }

  @override
  List<Object?> get props {
    return [currentPage, numberOfPages, limit, nextPage];
  }
}
