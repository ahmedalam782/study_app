part of 'cubit/home_cubit.dart';

class HomeState extends Equatable {
  final ProductHomeState? productHomeState;
  final CategoryHomeState? categoryHomeState;

  const HomeState({this.productHomeState, this.categoryHomeState});
  HomeState copyWith({
    ProductHomeState? productHomeState,
    CategoryHomeState? categoryHomeState,
  }) {
    return HomeState(
      productHomeState: productHomeState ?? this.productHomeState,
      categoryHomeState: categoryHomeState ?? this.categoryHomeState,
    );
  }

  @override
  String toString() {
    return 'HomeState(productHomeState: $productHomeState, categoryHomeState: $categoryHomeState)';
  }

  @override
  List<Object> get props => [
    productHomeState ?? ProductHomeState(),
    categoryHomeState ?? CategoryHomeState(),
  ];
}

class ProductHomeState extends BaseState {
  ProductHomeState({super.state, super.data, super.exception});
}

class CategoryHomeState extends BaseState {
  CategoryHomeState({super.state, super.data, super.exception});
}
