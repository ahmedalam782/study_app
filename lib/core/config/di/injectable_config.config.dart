// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../features/home/api/api_client/api_client.dart' as _i583;
import '../../../features/home/api/datasources/home_remote_data_source_impl.dart'
    as _i312;
import '../../../features/home/data/datasources/home_remote_data_source_contract.dart'
    as _i107;
import '../../../features/home/data/repositories/home_repositories_imp.dart'
    as _i911;
import '../../../features/home/domain/repositories/home_repositories.dart'
    as _i184;
import '../../../features/home/domain/use_cases/get_categories_use_case.dart'
    as _i11;
import '../../../features/home/domain/use_cases/get_products_use_case.dart'
    as _i631;
import '../../../features/home/presentation/view_model/cubit/home_bloc.dart'
    as _i29;
import '../../helper/user_helper/user_helper.dart' as _i23;
import '../api/app_interceptor.dart' as _i449;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreInjectableModule = _$CoreInjectableModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreInjectableModule.prefs(),
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => coreInjectableModule.dio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => coreInjectableModule.secureStorage(),
    );
    gh.lazySingleton<_i361.CancelToken>(
      () => coreInjectableModule.cancelToken(),
    );
    gh.singleton<_i23.UserHelper>(
      () => _i23.UserHelper(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i583.ApiClient>(() => _i583.ApiClient(gh<_i361.Dio>()));
    gh.singleton<_i449.AppInterceptors>(
      () => _i449.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i107.HomeRemoteDataSourceContract>(
      () => _i312.HomeRemoteDataSourceImpl(apiClient: gh<_i583.ApiClient>()),
    );
    gh.factory<_i184.HomeRepositories>(
      () => _i911.HomeRepositoriesImp(
        remoteDataSource: gh<_i107.HomeRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i11.GetCategoriesUseCase>(
      () => _i11.GetCategoriesUseCase(repository: gh<_i184.HomeRepositories>()),
    );
    gh.factory<_i631.GetProductsUseCase>(
      () => _i631.GetProductsUseCase(gh<_i184.HomeRepositories>()),
    );
    gh.factory<_i29.HomeBloc>(
      () => _i29.HomeBloc(
        gh<_i631.GetProductsUseCase>(),
        gh<_i11.GetCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
