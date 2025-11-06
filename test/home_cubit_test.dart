// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:study_app/core/config/base_state/base_state.dart';
// import 'package:study_app/features/home/presentation/view_model/cubit/home_cubit.dart';

// // Mock classes
// class MockGetProductsUseCase extends Mock implements GetProductsUseCase {}
// class MockGetCategoriesUseCase extends Mock implements GetCategoriesUseCase {}

// void main() {
//   late HomeCubit homeCubit;
//   late MockGetProductsUseCase mockGetProductsUseCase;
//   late MockGetCategoriesUseCase mockGetCategoriesUseCase;

//   setUp(() {
//     mockGetProductsUseCase = MockGetProductsUseCase();
//     mockGetCategoriesUseCase = MockGetCategoriesUseCase();
//     homeCubit = HomeCubit(mockGetProductsUseCase, mockGetCategoriesUseCase);
//   });

//   tearDown(() {
//     homeCubit.close();
//   });

//   group('HomeCubit', () {
//     test('initial state should be HomeState with default values', () {
//       expect(homeCubit.state, isA<HomeState>());
//     });

//     group('GetProductEvent', () {
//       final mockProducts = [
//         // Add your mock product data here
//         Product(id: 1, name: 'Product 1'),
//         Product(id: 2, name: 'Product 2'),
//       ];

//       blocTest<HomeCubit, HomeState>(
//         'emits [loading, success] when getProducts succeeds',
//         build: () {
//           when(() => mockGetProductsUseCase()).thenAnswer(
//             (_) async => Success(data: mockProducts),
//           );
//           return homeCubit;
//         },
//         act: (cubit) => cubit.doIntent(GetProductEvent()),
//         expect: () => [
//           // Loading state
//           HomeState(
//             productHomeState: ProductHomeState(state: StateType.loading),
//           ),
//           // Success state
//           HomeState(
//             productHomeState: ProductHomeState(
//               state: StateType.success,
//               data: mockProducts,
//             ),
//           ),
//         ],
//         verify: (_) {
//           verify(() => mockGetProductsUseCase()).called(1);
//         },
//       );

//       blocTest<HomeCubit, HomeState>(
//         'emits [loading, error] when getProducts fails',
//         build: () {
//           final exception = Exception('Failed to load products');
//           when(() => mockGetProductsUseCase()).thenAnswer(
//             (_) async => Error(exception: exception),
//           );
//           return homeCubit;
//         },
//         act: (cubit) => cubit.doIntent(GetProductEvent()),
//         expect: () => [
//           // Loading state
//           HomeState(
//             productHomeState: ProductHomeState(state: StateType.loading),
//           ),
//           // Error state
//           HomeState(
//             productHomeState: ProductHomeState(
//               state: StateType.error,
//               exception: isA<Exception>(),
//             ),
//           ),
//         ],
//         verify: (_) {
//           verify(() => mockGetProductsUseCase()).called(1);
//         },
//       );
//     });

//     group('GetCategoriesEvent', () {
//       final mockCategories = [
//         // Add your mock category data here
//         Category(id: 1, name: 'Category 1'),
//         Category(id: 2, name: 'Category 2'),
//       ];

//       blocTest<HomeCubit, HomeState>(
//         'emits [loading, success] when getCategories succeeds',
//         build: () {
//           when(() => mockGetCategoriesUseCase()).thenAnswer(
//             (_) async => Success(data: mockCategories),
//           );
//           return homeCubit;
//         },
//         act: (cubit) => cubit.doIntent(GetCategoriesEvent()),
//         expect: () => [
//           // Loading state
//           HomeState(
//             categoryHomeState: CategoryHomeState(state: StateType.loading),
//           ),
//           // Success state
//           HomeState(
//             categoryHomeState: CategoryHomeState(
//               state: StateType.success,
//               data: mockCategories,
//             ),
//           ),
//         ],
//         verify: (_) {
//           verify(() => mockGetCategoriesUseCase()).called(1);
//         },
//       );

//       blocTest<HomeCubit, HomeState>(
//         'emits [loading, error] when getCategories fails',
//         build: () {
//           final exception = Exception('Failed to load categories');
//           when(() => mockGetCategoriesUseCase()).thenAnswer(
//             (_) async => Error(exception: exception),
//           );
//           return homeCubit;
//         },
//         act: (cubit) => cubit.doIntent(GetCategoriesEvent()),
//         expect: () => [
//           // Loading state
//           HomeState(
//             categoryHomeState: CategoryHomeState(state: StateType.loading),
//           ),
//           // Error state
//           HomeState(
//             categoryHomeState: CategoryHomeState(
//               state: StateType.error,
//               exception: isA<Exception>(),
//             ),
//           ),
//         ],
//         verify: (_) {
//           verify(() => mockGetCategoriesUseCase()).called(1);
//         },
//       );
//     });

//     group('GetAllDataEvent', () {
//       final mockProducts = [Product(id: 1, name: 'Product 1')];
//       final mockCategories = [Category(id: 1, name: 'Category 1')];

//       blocTest<HomeCubit, HomeState>(
//         'emits states for both products and categories when both succeed',
//         build: () {
//           when(() => mockGetProductsUseCase()).thenAnswer(
//             (_) async => Success(data: mockProducts),
//           );
//           when(() => mockGetCategoriesUseCase()).thenAnswer(
//             (_) async => Success(data: mockCategories),
//           );
//           return homeCubit;
//         },
//         act: (cubit) => cubit.doIntent(GetAllDataEvent()),
//         expect: () => [
//           // Products loading
//           HomeState(
//             productHomeState: ProductHomeState(state: StateType.loading),
//           ),
//           // Categories loading
//           HomeState(
//             productHomeState: ProductHomeState(state: StateType.loading),
//             categoryHomeState: CategoryHomeState(state: StateType.loading),
//           ),
//           // Products success
//           HomeState(
//             productHomeState: ProductHomeState(
//               state: StateType.success,
//               data: mockProducts,
//             ),
//             categoryHomeState: CategoryHomeState(state: StateType.loading),
//           ),
//           // Categories success
//           HomeState(
//             productHomeState: ProductHomeState(
//               state: StateType.success,
//               data: mockProducts,
//             ),
//             categoryHomeState: CategoryHomeState(
//               state: StateType.success,
//               data: mockCategories,
//             ),
//           ),
//         ],
//         verify: (_) {
//           verify(() => mockGetProductsUseCase()).called(1);
//           verify(() => mockGetCategoriesUseCase()).called(1);
//         },
//       );

//       blocTest<HomeCubit, HomeState>(
//         'handles mixed success and error states',
//         build: () {
//           when(() => mockGetProductsUseCase()).thenAnswer(
//             (_) async => Success(data: mockProducts),
//           );
//           when(() => mockGetCategoriesUseCase()).thenAnswer(
//             (_) async => Error(exception: Exception('Category error')),
//           );
//           return homeCubit;
//         },
//         act: (cubit) => cubit.doIntent(GetAllDataEvent()),
//         expect: () => [
//           // Products loading
//           HomeState(
//             productHomeState: ProductHomeState(state: StateType.loading),
//           ),
//           // Categories loading
//           HomeState(
//             productHomeState: ProductHomeState(state: StateType.loading),
//             categoryHomeState: CategoryHomeState(state: StateType.loading),
//           ),
//           // Products success
//           HomeState(
//             productHomeState: ProductHomeState(
//               state: StateType.success,
//               data: mockProducts,
//             ),
//             categoryHomeState: CategoryHomeState(state: StateType.loading),
//           ),
//           // Categories error
//           HomeState(
//             productHomeState: ProductHomeState(
//               state: StateType.success,
//               data: mockProducts,
//             ),
//             categoryHomeState: CategoryHomeState(
//               state: StateType.error,
//               exception: isA<Exception>(),
//             ),
//           ),
//         ],
//         verify: (_) {
//           verify(() => mockGetProductsUseCase()).called(1);
//           verify(() => mockGetCategoriesUseCase()).called(1);
//         },
//       );
//     });

//     test('does not emit when cubit is closed', () async {
//       await homeCubit.close();
      
//       expect(homeCubit.isClosed, true);
      
//       // This should not throw or emit
//       homeCubit.emit(HomeState());
//     });
//   });
// }