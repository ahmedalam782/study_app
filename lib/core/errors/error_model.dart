import 'package:easy_localization/easy_localization.dart';
import 'package:study_app/generated/lib/core/languages/locale_keys.g.dart';

class ApiErrorModel {
  int? status;
  String? message;

  ApiErrorModel({this.status, this.message});

  ApiErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }

  String getErrorMessage() {
    return message ?? LocaleKeys.error_api_failure_unexpected_error.tr();
  }
}
