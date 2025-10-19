import 'package:flutter/material.dart';

enum LanguageType { arabic, english }

const String arabic = 'ar';
const String english = 'en';

const String assetsLocalization = 'lib/core/localization';

const Locale arabicLocale = Locale("ar", "EG");
const Locale englishLocale = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.arabic:
        return arabic;
      case LanguageType.english:
        return english;
    }
  }
}

class LanguageHelper {
  static const String arabicFontFamily = '';
  static const String englishFontFamily = '';
}
