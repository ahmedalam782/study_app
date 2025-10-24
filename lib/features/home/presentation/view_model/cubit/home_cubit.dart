import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:study_app/core/config/base_response/result.dart';
import 'package:study_app/core/config/base_state/base_state.dart';
import 'package:study_app/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:study_app/features/home/domain/use_cases/get_products_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  HomeCubit(this.getProductsUseCase, this.getCategoriesUseCase)
    : super(HomeState());

  Future<void> getAllData() async {
     getProducts();
     getCategories();
  }

  Future<void> getProducts() async {
    emit(
      state.copyWith(
        productHomeState: ProductHomeState(state: StateType.loading),
      ),
    );
    final result = await getProductsUseCase();
    switch (result) {
      case Success():
        emit(
          state.copyWith(
            productHomeState: ProductHomeState(
              state: StateType.success,
              data: result.data,
            ),
          ),
        );
        break;
      case Error():
        emit(
          state.copyWith(
            productHomeState: ProductHomeState(
              state: StateType.error,
              exception: result.exception,
            ),
          ),
        );
        break;
    }
  }

  Future<void> getCategories() async {
    emit(
      state.copyWith(
        categoryHomeState: CategoryHomeState(state: StateType.loading),
      ),
    );
    final result = await getCategoriesUseCase();
    switch (result) {
      case Success():
        emit(
          state.copyWith(
            categoryHomeState: CategoryHomeState(
              state: StateType.success,
              data: result.data,
            ),
          ),
        );
        break;
      case Error():
        emit(
          state.copyWith(
            categoryHomeState: CategoryHomeState(
              state: StateType.error,
              exception: result.exception,
            ),
          ),
        );
        break;
    }
  }
}
