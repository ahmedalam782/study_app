import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:study_app/core/languages/lang.dart';
import 'app_colors.dart';
import 'styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primaryLight,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
      background: AppColors.backgroundLight,
      onBackground: AppColors.onBackgroundLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
      error: AppColors.errorLight,
      onError: AppColors.onErrorLight,
    ),
    // Note: For responsive text, use Styles.regular/bold/etc. in your widgets.
    // ThemeData.textTheme must use static TextStyle (no context allowed).
    // Note: For responsive text, use Styles.regular/bold/etc. in your widgets.
    textTheme: TextTheme(
      bodyLarge: Styles.bold(context, 16),
      bodyMedium: Styles.medium(context, 14),
      bodySmall: Styles.regular(context, 12),
    ),
    fontFamily: context.locale.languageCode == 'ar'
        ? LanguageHelper.arabicFontFamily
        : LanguageHelper.englishFontFamily,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.backgroundLight,
      iconTheme: IconThemeData(color: AppColors.primaryLight),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.onPrimaryLight,
      shape: CircleBorder(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      contentPadding: const EdgeInsets.all(14.0),
      isDense: true,
      hintStyle: TextStyle(
        color: AppColors.onSurfaceLight.withValues(alpha: 0.6),
      ),
      labelStyle: TextStyle(
        color: AppColors.onSurfaceLight.withValues(alpha: 0.8),
      ),
      focusColor: AppColors.primaryLight,
      floatingLabelStyle: TextStyle(
        color: AppColors.primaryLight,
        fontSize: 18,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.surfaceLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColors.surfaceLight, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.primaryLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorLight, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryLight),
        foregroundColor: WidgetStateProperty.all<Color>(
          AppColors.onPrimaryLight,
        ),
        overlayColor: WidgetStateProperty.all<Color>(
          AppColors.primaryLight.withValues(alpha: 0.1),
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surfaceLight,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primaryDark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondaryDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      error: AppColors.errorDark,
      onError: AppColors.onErrorDark,
    ),
    // Note: For responsive text, use Styles.regular/bold/etc. in your widgets.
    // ThemeData.textTheme must use static TextStyle (no context allowed).
    // Note: For responsive text, use Styles.regular/bold/etc. in your widgets.
    textTheme: TextTheme(
      bodyLarge: Styles.bold(context, 16),
      bodyMedium: Styles.medium(context, 14),
      bodySmall: Styles.regular(context, 12),
    ),
    fontFamily: context.locale.languageCode == 'ar'
        ? LanguageHelper.arabicFontFamily
        : LanguageHelper.englishFontFamily,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.backgroundDark,
      iconTheme: IconThemeData(color: AppColors.primaryDark),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.onPrimaryDark,
      shape: CircleBorder(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceDark,
      contentPadding: const EdgeInsets.all(14.0),
      isDense: true,
      hintStyle: TextStyle(
        color: AppColors.onSurfaceDark.withValues(alpha: 0.6),
      ),
      labelStyle: TextStyle(
        color: AppColors.onSurfaceDark.withValues(alpha: 0.8),
      ),
      focusColor: AppColors.primaryDark,
      floatingLabelStyle: TextStyle(color: AppColors.primaryDark, fontSize: 18),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.surfaceDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColors.surfaceDark, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.primaryDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorDark, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryDark),
        foregroundColor: WidgetStateProperty.all<Color>(
          AppColors.onPrimaryDark,
        ),
        overlayColor: WidgetStateProperty.all<Color>(
          AppColors.primaryDark.withValues(alpha: 0.1),
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surfaceDark,
    ),
  );
}
