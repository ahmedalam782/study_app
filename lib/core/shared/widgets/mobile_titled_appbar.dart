import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:va_note/core/routes/routes.dart';
import 'package:va_note/core/theme/styles.dart';

import '../../theme/app_colors.dart';

AppBar buildMobileTitledAppBar(
  BuildContext context, {
  String? title,
  Widget? trailing,
  void Function()? onTap,
}) {
  return AppBar(
    elevation: 0,

    leading: InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        } else {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(Routes.home);
          }
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 8),
          Icon(Icons.arrow_back_ios, size: 16, color: AppColors.black27),
          if (title != null)
            Material(
              color: Colors.transparent,
              child: Hero(
                tag: title,
                child: Text(
                  title,
                  style: Styles.regular16.copyWith(color: AppColors.gray52),
                ),
              ),
            ),
        ],
      ),
    ),
    leadingWidth: 300,
    actions: [?trailing],
  );
}
