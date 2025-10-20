import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toastification/toastification.dart';

import '../../theme/app_colors.dart';
import '../../theme/styles.dart';

class CustomToast {
  final BuildContext context;
  final String? header;
  final String? description;

  ToastificationType? type;
  final bool isWeb;

  CustomToast({
    required this.context,
    this.header,
    this.description,
    this.type = ToastificationType.success,
    this.isWeb = kIsWeb,
  });

  void showToast() {
    toastification.show(
      primaryColor: type == ToastificationType.success
          ? AppColors.green17
          : null,
      style: ToastificationStyle.fillColored,
      alignment: isWeb ? AlignmentDirectional.topEnd : Alignment.topCenter,
      type: type,
      closeOnClick: true,
      dragToClose: true,
      showProgressBar: true,
      showIcon: false,
      context: context,
      title: Text(
        header ?? "",
        style: Styles.medium16.copyWith(color: AppColors.originalWhite),
      ),
      description: description != null
          ? Text(
              description!,
              style: Styles.regular16.copyWith(color: AppColors.originalWhite),
            )
          : null,
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  void showAlertToast({
    String? icon,
    Color? mainColor,
    Color? backgroundColor,
    String? title,
    String? message,
  }) {
    toastification.show(
      primaryColor: backgroundColor ?? AppColors.originalWhite,
      style: ToastificationStyle.fillColored,
      alignment: isWeb ? AlignmentDirectional.topEnd : Alignment.topCenter,
      type: type,
      closeOnClick: false,
      dragToClose: true,
      showProgressBar: false,
      showIcon: false,
      context: context,
      applyBlurEffect: true,
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
      closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
      title: icon != null
          ? Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:
                      (mainColor?.withValues(alpha: 0.1)) ??
                      AppColors.black27.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      mainColor ?? AppColors.black27,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            )
          : null,
      description: Text(
        message ?? "",
        textAlign: TextAlign.center,
        style: Styles.regular16,
      ),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
}
