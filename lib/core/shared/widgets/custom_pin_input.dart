import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../theme/app_colors.dart';
import '../../theme/styles.dart';

class CustomPinInput extends StatelessWidget {
  const CustomPinInput({
    super.key,
    this.validator,
    this.onCompleted,
    this.onSubmitted,
    this.closeKeyboardWhenCompleted = false,
    this.controller,
    this.isEnabled = true,
    this.onChange,
    this.length = 4,
  });
  final String? Function(String? value)? validator;
  final void Function(String value)? onCompleted;
  final void Function(String value)? onSubmitted;
  final void Function(String value)? onChange;
  final bool closeKeyboardWhenCompleted, isEnabled;
  final TextEditingController? controller;
  final int? length;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        enabled: isEnabled,
        length: length!,
        enableSuggestions: true,
        crossAxisAlignment: CrossAxisAlignment.center,
        cursor: Container(
          width: 1.5,
          height: 25,
          decoration: const BoxDecoration(
            color: AppColors.primerColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(99999),
              top: Radius.circular(99999),
            ),
          ),
        ),
        pinContentAlignment: Alignment.center,
        controller: controller,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        errorPinTheme: errorPinTheme,
        validator: validator,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        onCompleted: onCompleted,
        onSubmitted: onSubmitted,
        onChanged: onChange,
        animationCurve: Curves.bounceInOut,
        animationDuration: const Duration(milliseconds: 300),
        closeKeyboardWhenCompleted: closeKeyboardWhenCompleted,
        isCursorAnimationEnabled: true,
        keyboardType: TextInputType.number,
      ),
    );
  }

  static final PinTheme defaultPinTheme = PinTheme(
    width: 48,
    height: 48,
    textStyle: Styles.semibold24.copyWith(color: AppColors.primerColor),
    decoration: BoxDecoration(
      color: AppColors.grayF4,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColors.originalBlack.withValues(alpha: 0.05),
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(0, 1),
        ),
      ],
    ),
  );
  static final PinTheme focusedPinTheme = defaultPinTheme.copyWith(
    decoration: BoxDecoration(
      color: AppColors.purple97B10,
      border: Border.all(color: AppColors.primerColor, width: 2),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColors.originalBlack.withValues(alpha: 0.05),
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(0, 1),
        ),
      ],
    ),
  );
  static final PinTheme submittedPinTheme = defaultPinTheme.copyWith(
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primerColor, width: 1),
      color: AppColors.purple97B10,

      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColors.originalBlack.withValues(alpha: 0.05),
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(0, 1),
        ),
      ],
    ),
  );
  static final PinTheme errorPinTheme = defaultPinTheme.copyWith(
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.originalRed, width: 2),
      color: AppColors.originalRed.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColors.originalBlack.withValues(alpha: 0.05),
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(0, 1),
        ),
      ],
    ),
  );
}
