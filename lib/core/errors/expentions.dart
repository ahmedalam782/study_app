import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:study_app/generated/lib/core/languages/locale_keys.g.dart';

import 'error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: LocaleKeys.error_api_failure_connectionError.tr(),
          );
        case DioExceptionType.cancel:
          return ApiErrorModel(
            message: LocaleKeys.error_api_failure_cancelled.tr(),
          );
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            message: LocaleKeys.error_api_failure_connectionTimeout.tr(),
          );
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: LocaleKeys.error_api_failure_unknown.tr(),
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: LocaleKeys.error_api_failure_receiveTimeout.tr(),
          );
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: LocaleKeys.error_api_failure_sendTimeout.tr(),
          );
        default:
          return ApiErrorModel(
            message: LocaleKeys.error_api_failure_unexpected_error.tr(),
          );
      }
    } else {
      return ApiErrorModel(
        message: LocaleKeys.error_api_failure_unexpected_error.tr(),
      );
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] ?? "error_api_failure.unexpected_error".tr(),
    status: data['status'] ?? data['code'],
  );
}
