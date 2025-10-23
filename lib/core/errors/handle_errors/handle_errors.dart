import 'package:easy_localization/easy_localization.dart';
import 'package:study_app/core/shared/widgets/no_internet_widget.dart';
import 'package:study_app/core/errors/failures.dart';
import 'package:study_app/generated/lib/core/languages/locale_keys.g.dart';

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
      NoInternetWidget(onPressed: onPressed),
    NetworkFailures() => NoInternetWidget(onPressed: onPressed),
    _ => handleError(exception),
  };
}

bool isNetworkWidget(Object? result) => result is NoInternetWidget;
// void handleResult(Object? result) {
//   (isNetworkWidget(result)) ? result as NoInternetWidget : result as String?;
// }
