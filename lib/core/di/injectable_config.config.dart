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

import '../../features/home/api/apiclient/api_client.dart' as _i463;
import '../../features/home/data/datasources/home_remote_data_source_contract.dart'
    as _i969;
import '../../features/home/data/repositories/home_repositories_imp.dart'
    as _i440;
import '../../features/home/domain/repositories/home_repositories.dart'
    as _i688;
import '../../features/home/domain/usecases/get_categories_use_case.dart'
    as _i132;
import '../../features/home/domain/usecases/get_products_use_case.dart'
    as _i954;
import '../api/app_interceptor.dart' as _i449;
import '../helper/user_helper/user_helper.dart' as _i255;
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
      () => coreInjectableModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => coreInjectableModule.dio());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => coreInjectableModule.secureStorage,
    );
    gh.lazySingleton<_i361.CancelToken>(
      () => coreInjectableModule.cancelToken(),
    );
    gh.singleton<_i255.UserHelper>(
      () => _i255.UserHelper(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i688.HomeRepositories>(
      () => _i440.HomeRepositoriesImp(
        remoteDataSource: gh<_i969.HomeRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i463.ApiClient>(
      () => _i463.ApiClient(gh<_i361.Dio>(), baseUrl: gh<String>()),
    );
    gh.singleton<_i449.AppInterceptors>(
      () => _i449.AppInterceptors(
        dio: gh<_i361.Dio>(),
        fss: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i132.GetCategoriesUseCase>(
      () =>
          _i132.GetCategoriesUseCase(repository: gh<_i688.HomeRepositories>()),
    );
    gh.factory<_i954.GetProductsUseCase>(
      () => _i954.GetProductsUseCase(gh<_i688.HomeRepositories>()),
    );
    return this;
  }
}

class _$CoreInjectableModule extends _i291.CoreInjectableModule {}
