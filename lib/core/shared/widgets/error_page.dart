import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_images.dart';
import '../../theme/styles.dart';

class ErrorPage extends StatelessWidget {
  final bool isConnectionerror;
  final bool isScrollable;
  final String? image, message;
  final Future<void> Function()? onRefresh;
  final double? width;
  const ErrorPage({
    super.key,
    this.isConnectionerror = false,
    this.image,
    this.message,
    this.onRefresh,
    this.width,
    this.isScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            if (onRefresh != null) {
              await onRefresh!();
            }
          },
          color: AppColors.originalWhite,
          backgroundColor: AppColors.primerColor,
          child: SingleChildScrollView(
            physics: isScrollable
                ? const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  )
                : NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  image ??
                      (isConnectionerror
                          ? AppImages.coreCommonAssetsImagesConnectionError
                          : AppImages.coreCommonAssetsImagesError),
                  width: width ?? 1.sw,
                ),
                Text(
                  message ??
                      (isConnectionerror
                          ? "failures.offline_failure".tr()
                          : "failures.unknown_failure".tr()),
                  style: Styles.regular20.copyWith(color: AppColors.grayB6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
