import 'package:flutter/material.dart';

import 'app_colors.dart';

ScrollbarThemeData customScrollTheme = ScrollbarThemeData(
  thumbColor: WidgetStatePropertyAll<Color>(AppColors.black),
  trackColor: WidgetStatePropertyAll<Color>(AppColors.surfaceLight),
  thickness: WidgetStatePropertyAll<double>(6),
  thumbVisibility: WidgetStatePropertyAll<bool>(true),
  trackVisibility: WidgetStatePropertyAll<bool>(false),
  interactive: true,
  crossAxisMargin: 2,
  mainAxisMargin: 2,
  trackBorderColor: WidgetStatePropertyAll(Colors.transparent),
  radius: const Radius.circular(9999),
);

class NoScrollbarBehavior extends ScrollBehavior {
  const NoScrollbarBehavior();
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
