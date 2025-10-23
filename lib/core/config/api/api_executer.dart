import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:study_app/core/config/base_response/result.dart';
import 'package:study_app/core/errors/failures.dart';
import 'package:study_app/core/network/network_info.dart';

Future<Result<T>> executeApi<T>(
  Future<T> Function() apiCall,
  NetworkInfo networkInfo,
) async {
  if (!await networkInfo.isConnected) {
    return Error<T>(
      exception: NetworkFailures(errorMessage: "no_internet".tr()) as Failures,
    );
  }
  try {
    var result = await apiCall.call();
    return Success<T>(data: result);
  } on DioException catch (ex) {
    return Error<T>(
      exception: ServerFailure.fromDioException(dioException: ex),
    );
  } on Exception catch (ex) {
    return Error<T>(exception: ex);
  }
}
