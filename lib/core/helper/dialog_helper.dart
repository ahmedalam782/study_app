import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:study_app/core/shared/widgets/custom_button.dart';
import 'package:study_app/core/theme/app_colors.dart';
import 'package:study_app/core/theme/styles.dart';

class DialogHelper {
  static void showCustomDialog({
    required BuildContext context,
    Widget? child,
    String? title,
    String? message,
    String? buttonText,

    void Function()? onTap,
  }) => showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder:
        (
          BuildContext buildContext,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return Center(
            child: AlertDialog(
              constraints: BoxConstraints(maxWidth: 700.w.clamp(500, 700)),
              contentPadding: EdgeInsets.all(16),
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text(title ?? "", style: Styles.medium(context, 20))),
                  IconButton(
                    onPressed: () => context.canPop() ? context.pop() : null,
                    icon: Icon(
                      Icons.close_rounded,
                      color: AppColors.onBackgroundDark,
                      size: 20,
                    ),
                  ),
                ],
              ),
              content: Column(
                spacing: 24.w.clamp(8, 24),
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      message ?? "",
                      style: Styles.light(context, 14).copyWith(color: AppColors.gray71),
                    ),
                  ),
                  if (child != null) child,
                  if (onTap != null)
                    Divider(height: 0.5, color: AppColors.grayE4),
                ],
              ),
              actions: [
                if (onTap != null)
                  CustomButton(
                    title: buttonText ?? "custom_widget.done".tr(),
                    onTap: onTap,
                  ),
              ],
            ),
          );
        },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(
              CurvedAnimation(
                parent: animation,
                reverseCurve: Curves.easeInOut,
                curve: Curves.easeInOut,
              ),
            ),
        child: child,
      );
    },
  );
  static void showCustomAlertDialog({
    required BuildContext context,
    String? title,
    String? icon,
    String? message,
    String? mainButtonText,
    Color? mainColor,
    bool isMobile = false,

    Future<void> Function()? onTap,
    Future<void> Function()? onSuccess,
  }) => showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder:
        (
          BuildContext buildContext,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          bool isLoading = false;
          return AlertDialog(
            constraints: BoxConstraints(maxWidth: 700.w.clamp(500, 700)),
            contentPadding: EdgeInsets.all(16),
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: icon != null
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          (mainColor?.withValues(alpha: 0.1)) ??
                          AppColors.backgroundDark.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        icon,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          mainColor ?? AppColors.backgroundDark,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  )
                : null,
            content: Column(
              spacing: 4,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    title ?? "",
                    textAlign: TextAlign.center,
                    style: Styles.medium(context, 24),
                  ),
                ),
                Flexible(
                  child: Text(
                    message ?? "",
                    textAlign: TextAlign.center,
                    style: Styles.regular(context, 16).copyWith(color: AppColors.gray71),
                  ),
                ),
              ],
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12,
                ),
                child: isMobile
                    ? Column(
                        children: [
                          StatefulBuilder(
                            builder: (buttonContext, buttonSetState) {
                              return CustomButton(
                                title:
                                    mainButtonText ?? "custom_widget.done".tr(),
                                backGroundColor: mainColor,
                                isGradient: false,
                                isLoading: isLoading,
                                titleStyle: Styles.semiBold(context, 16).copyWith(
                                  color: AppColors.white,
                                ),
                                onTap: () async {
                                  buttonSetState(() {
                                    isLoading = true;
                                  });
                                  if (onTap != null) {
                                    await onTap();
                                  }
                                  buttonSetState(() {
                                    isLoading = true;
                                  });
                                },
                              );
                            },
                          ),
                          SizedBox(height: 8),
                          CustomButton(
                            title: "custom_widget.cancel".tr(),

                            borderColor: AppColors.gray92,
                            backGroundColor: AppColors.white,
                            titleStyle: Styles.semiBold(context, 16).copyWith(
                              color: AppColors.gray71,
                            ),
                            isGradient: false,
                            onTap: () =>
                                context.canPop() ? context.pop() : null,
                          ),
                        ],
                      )
                    : Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: CustomButton(
                              title: "custom_widget.cancel".tr(),

                              borderColor: AppColors.gray92,
                              backGroundColor: AppColors.white,
                              titleStyle: Styles.semiBold(context, 16).copyWith(
                                color: AppColors.gray71,
                              ),
                              isGradient: false,
                              onTap: () =>
                                  context.canPop() ? context.pop() : null,
                            ),
                          ),
                          Expanded(
                            child: StatefulBuilder(
                              builder: (buttonContext, buttonSetState) {
                                return CustomButton(
                                  title:
                                      mainButtonText ??
                                      "custom_widget.done".tr(),
                                  backGroundColor: mainColor,
                                  isGradient: false,
                                  isLoading: isLoading,
                                  titleStyle: Styles.semiBold(context, 16).copyWith(
                                    color: AppColors.white,
                                  ),
                                  onTap: () async {
                                    buttonSetState(() {
                                      isLoading = true;
                                    });
                                    if (onTap != null) {
                                      await onTap();
                                    }
                                    buttonSetState(() {
                                      isLoading = true;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          );
        },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(
              CurvedAnimation(
                parent: animation,
                reverseCurve: Curves.easeInOut,
                curve: Curves.easeInOut,
              ),
            ),

        child: child,
      );
    },
  );
}
