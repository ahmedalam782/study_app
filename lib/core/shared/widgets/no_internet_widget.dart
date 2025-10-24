import 'package:easy_localization/easy_localization.dart';
import 'package:study_app/core/languages/locale_keys.g.dart';
import 'package:study_app/core/shared/widgets/custom_button.dart'
    show CustomButton;
import 'package:study_app/core/theme/app_images.dart';
import 'package:study_app/core/theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.imagesConnectionError, height: 220),
                const SizedBox(height: 20),
                Text(
                  LocaleKeys.global_no_internet.tr(),
                  style: Styles.semiBold(context, 20),
                ),
                const SizedBox(height: 5),
                Text(
                  LocaleKeys.global_check_internet.tr(),
                  textAlign: TextAlign.center,
                  style: Styles.medium(context, 18),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 420,
                    minWidth: 300,
                  ),
                  child: CustomButton(
                    onTap: onPressed,
                    isGradient: false,
                    title: LocaleKeys.custom_widget_try_again.tr(),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
