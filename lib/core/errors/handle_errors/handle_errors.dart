import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:study_app/core/languages/locale_keys.g.dart';
import 'package:study_app/core/shared/widgets/no_internet_widget.dart';
import 'package:study_app/core/errors/failures.dart';

String? handleError(Exception? exception) {
  return switch (exception) {
    ServerFailure() => exception.errorMessage,
    OfflineFailures() => exception.errorMessage,
    CacheFailures() => exception.errorMessage,
    _ => LocaleKeys.error_api_failure_unexpected_error.tr(),
  };
}

Object? handleNetwork(Exception? exception, void Function()? onPressed) {
  return switch (exception) {
    ServerFailure()
        when connectionErrorsList.contains(exception.errorMessage) =>
      Expanded(child: NoInternetWidget(onPressed: onPressed)),
    NetworkFailures() => Expanded(
      child: NoInternetWidget(onPressed: onPressed),
    ),
    _ => handleError(exception),
  };
}

bool isNetworkWidget(Object? result) => result is NoInternetWidget;
// void handleResult(Object? result) {
//   (isNetworkWidget(result)) ? result as NoInternetWidget : result as String?;
// }
