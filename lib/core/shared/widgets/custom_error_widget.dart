import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:study_app/generated/lib/core/languages/locale_keys.g.dart';

import '../../theme/styles.dart';
import 'custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    this.errorMessage,
    this.onPressed,
    this.color,
  });

  final String? errorMessage;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              errorMessage ??
                  LocaleKeys.error_api_failure_unexpected_error.tr(),
              style: Styles.medium(context, 16),
            ),
            const SizedBox(height: 16),
            if (onPressed != null)
              CustomButton(
                title: LocaleKeys.custom_widget_try_again.tr(),
                onTap: onPressed ?? () {},
              ),
          ],
        ),
      ),
    );
  }
}
