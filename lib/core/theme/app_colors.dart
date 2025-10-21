import 'package:flutter/material.dart';

/// Centralized color palette for both light and dark themes.
abstract class AppColors {
  // --- Light Theme Colors ---
  static const Color primaryLight = Color(0xFF1976D2); // Example blue
  static const Color secondaryLight = Color(0xFF26A69A); // Example teal
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF5F5F5);
  static const Color errorLight = Color(0xFFD32F2F);
  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color onSecondaryLight = Color(0xFFFFFFFF);
  static const Color onBackgroundLight = Color(0xFF000000);
  static const Color onSurfaceLight = Color(0xFF000000);
  static const Color onErrorLight = Color(0xFFFFFFFF);

  // --- Dark Theme Colors ---
  static const Color primaryDark = Color(0xFF90CAF9); // Lighter blue
  static const Color secondaryDark = Color(0xFF80CBC4); // Lighter teal
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color errorDark = Color(0xFFCF6679);
  static const Color onPrimaryDark = Color(0xFF000000);
  static const Color onSecondaryDark = Color(0xFF000000);
  static const Color onBackgroundDark = Color(0xFFFFFFFF);
  static const Color onSurfaceDark = Color(0xFFFFFFFF);
  static const Color onErrorDark = Color(0xFF000000);

  // --- Common Colors (used in both themes) ---
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
  static const Color gray71 = Color(0xff71717A);
  static const Color gray52 = Color(0xff52525B);
  static const Color grayD9 = Color(0xFFD9D9D9);
  static const Color grayE4 = Color(0xffE4E4E7);
  static const Color gray92 = Color(0xff929292);
  static const Color grayC3 = Color(0xffC3C3C3);
  static const Color grayFD = Color(0xffFDFDFD);
  static const Color grayB6 = Color(0xffB6B6BB);
  static const Color grayF4 = Color(0xffF4F4F5);
  static const Color green4C = Color(0xFF4CAF50);

  // gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1976D2), Color(0xFF26A69A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
