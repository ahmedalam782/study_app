import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

class Validations {
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "validations.password_required".tr();
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return "validations.set_password_1_condition_error".tr();
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "validations.set_password_2_condition_error".tr();
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "validations.set_password_3_condition_error".tr();
    }

    if (!value.contains(
      RegExp(r'[!@#\$%\^&\*\(\)_\-\+=\[\]\{\};:\,<>\./\\|~`]'),
    )) {
      return "validations.set_password_4_condition_error".tr();
    }

    if (value.length < 6 || value.length > 30) {
      return "validations.set_password_5_condition_error".tr();
    }

    return null;
  }

  static String? validatePasswordVerification(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "validations.confirm_password".tr();
    } else if (value != password) {
      return "validations.confirm_password_invalid".tr();
    }
    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "validations.password_required".tr();
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, int phoneLength) {
    if (value == null || value.isEmpty) {
      return "validations.phone_required".tr();
    } else if (value.length < phoneLength) {
      return "validations.phone_invalid".tr();
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "validations.name_required".tr();
    } else {
      return null;
    }
  }

  static String? validatePin(String? value, int length) {
    if (value == null || value.isEmpty) {
      return "validations.pin_required".tr();
    }
    if (value.length != length) {
      return "validations.pin_invalid".tr();
    } else {
      return null;
    }
  }

  static String? validateUserImage(File? value) {
    if (value == null) {
      return "validations.profile_image".tr();
    } else {
      return null;
    }
  }

  static String? validateArabicName(String? value) {
    if (value == null || value.isEmpty) {
      return "validations.arabic_name".tr();
    }

    return null;
  }

  static String? validateEnglishName(String? value) {
    if (value == null || value.isEmpty) {
      return "validations.english_name".tr();
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "validations.email_required".tr();
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return "validations.email_invalid".tr();
    }

    return null;
  }

  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return "validations.username_required".tr();
    }

    return null;
  }
}
