import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/styles.dart';

class PassTextFormField extends StatefulWidget {
  const PassTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.enableFocusBorder = true,
    this.labelWidget,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.prefixWidget,
    this.textStyle,
    this.enableFill = true,
    this.fillColor,
    this.title,
    this.labelStyle,
    this.focusBorderColor,
    this.floatingLabelBehavior,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.headerText,
    this.isReadOnly = false,
    this.headerTextStyle,
    this.spacing = 0,
    this.inputFormatters,
    this.contentPadding,
    this.maxLength,
    this.textAlign,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.onSaved,
    this.hintStyle,
    this.hintText,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.textDirection,
    this.disabledBorder,
    this.isDense = false,
    this.obscuringCharacter,
    this.primer = false,
  });
  final Widget? labelWidget;
  final double? borderRadius;
  final TextAlign? textAlign;
  final String? Function(String? value)? validator;
  final double? borderWidth;
  final Color? borderColor;
  final Color? fillColor;
  final bool enableFill;
  final Widget? prefixWidget;
  final double? spacing;
  final bool enableFocusBorder;
  final bool primer;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? title;
  final TextStyle? hintStyle;
  final String? hintText;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color? focusBorderColor;
  final FocusNode? focusNode;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final String? headerText, obscuringCharacter;
  final TextStyle? headerTextStyle;
  final bool isReadOnly;
  final EdgeInsetsDirectional? contentPadding;
  final int? maxLength;
  final bool isDense;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final TextDirection? textDirection;

  @override
  State<PassTextFormField> createState() => _PassTextFormFieldState();
}

class _PassTextFormFieldState extends State<PassTextFormField> {
  bool _isPasswordVisible = false;
  FocusNode? _focusNode;
  List<bool> passwordConditionsState = [false, false, false, false, false];
  final List<String> passwordConditions = [
    "validations.set_password_1_condition",
    "validations.set_password_2_condition",
    "validations.set_password_3_condition",
    "validations.set_password_4_condition",
    "validations.set_password_5_condition",
  ];

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode?.addListener(() {
      _focusNode!.hasFocus ? setState(() {}) : null;
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        if (widget.title != null && widget.title!.isNotEmpty) ...[
          Text(
            widget.title ?? "",
            style: Styles.light(context, 14).copyWith(color: AppColors.black),
          ),
          SizedBox(height: 6),
        ],
        TextFormField(
          focusNode: _focusNode,
          textDirection: widget.textDirection,
          obscuringCharacter: widget.obscuringCharacter ?? "•",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: widget.onSaved,
          onEditingComplete: widget.onEditingComplete,
          onTap: widget.onTap,
          onChanged: widget.primer
              ? (value) => _updatePasswordConditions(value)
              : widget.onChanged,
          onTapOutside: (pos) {
            FocusScope.of(context).unfocus();
          },
          autofocus: false,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          readOnly: widget.isReadOnly,
          obscureText: !_isPasswordVisible,
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          controller: widget.controller,
          maxLines: 1,
          textAlign: widget.textAlign ?? TextAlign.start,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: AppColors.primaryLight,
          style: widget.textStyle ?? Styles.regular(context, 16),
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            hoverColor: AppColors.primaryLight,
            fillColor: widget.fillColor,
            filled: widget.enableFill,
            isDense: widget.isDense,
            counterText: "",
            hintText: widget.hintText,
            hintStyle:
                widget.hintStyle ??
                Styles.light(context, 14).copyWith(color: AppColors.gray71),
            contentPadding:
                widget.contentPadding ??
                REdgeInsetsDirectional.only(
                  start: 12,
                  end: 4,
                  bottom: 10,
                  top: 10,
                ),
            alignLabelWithHint: true,
            focusColor: Colors.black,
            errorStyle: widget.primer
                ? const TextStyle(height: 0, fontSize: 0)
                : null,
            suffixIcon: _buildToggleVisibilityButton(),
            prefixIcon:
                widget.prefixWidget ??
                SvgPicture.asset(
                  AppIcons.iconsLock,
                  colorFilter: ColorFilter.mode(
                    AppColors.gray71,
                    BlendMode.srcIn,
                  ),
                  width: 20,
                  height: 20,
                  fit: BoxFit.scaleDown,
                ),
            label: widget.labelWidget,
            floatingLabelBehavior:
                widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            errorBorder:
                widget.enabledBorder ??
                customOutLineBorders(borderColor: AppColors.errorLight),
            disabledBorder: widget.disabledBorder ?? customOutLineBorders(),
            border: widget.border ?? customOutLineBorders(),
            enabledBorder: widget.enabledBorder ?? customOutLineBorders(),
            focusedBorder:
                widget.focusedBorder ??
                customOutLineBorders(
                  borderColor: widget.enableFocusBorder
                      ? AppColors.primaryLight
                      : null,
                  borderWidth: 1.5,
                ),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeInOutBack,
          switchOutCurve: Curves.easeInOutBack,
          transitionBuilder: (child, animation) {
            return ClipRect(
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1.0,
                child: child,
              ),
            );
          },
          child: widget.primer && _focusNode!.hasFocus
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              switchInCurve: Curves.easeInOut,
                              switchOutCurve: Curves.easeInOut,
                              transitionBuilder: (child, animation) {
                                return ClipRect(
                                  child: SlideTransition(
                                    position:
                                        Tween<Offset>(
                                          begin: const Offset(1, 0),
                                          end: Offset.zero,
                                        ).animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeInOut,
                                          ),
                                        ),
                                    child: child,
                                  ),
                                );
                              },
                              child: SvgPicture.asset(
                                passwordConditionsState[index]
                                    ? AppIcons.iconsCheckCircle2
                                    : AppIcons.iconsCloseCircle,
                                key: ValueKey<bool>(
                                  passwordConditionsState[index],
                                ),
                                height: 15,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                style: !passwordConditionsState[index]
                                    ? Styles.regular(
                                        context,
                                        14,
                                      ).copyWith(color: AppColors.errorLight)
                                    : Styles.regular(context, 14),
                                child: Text(passwordConditions[index].tr()),
                              ),
                            ),
                          ],
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 6),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 2,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              switchInCurve: Curves.easeInOut,
                              switchOutCurve: Curves.easeInOut,
                              transitionBuilder: (child, animation) {
                                return ClipRect(
                                  child: SlideTransition(
                                    position:
                                        Tween<Offset>(
                                          begin: const Offset(1, 0),
                                          end: Offset.zero,
                                        ).animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeInOut,
                                          ),
                                        ),
                                    child: child,
                                  ),
                                );
                              },
                              child: SvgPicture.asset(
                                passwordConditionsState[index + 3]
                                    ? AppIcons.iconsCheckCircle2
                                    : AppIcons.iconsCloseCircle,
                                key: ValueKey<bool>(
                                  passwordConditionsState[index + 3],
                                ),
                                height: 15,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            const SizedBox(width: 10),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              style: !passwordConditionsState[index + 3]
                                  ? Styles.regular(
                                      context,
                                      14,
                                    ).copyWith(color: AppColors.errorLight)
                                  : Styles.regular(context, 14),
                              child: Text(passwordConditions[index + 3].tr()),
                            ),
                          ],
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 6),
                      ),
                    ),
                  ],
                )
              : const SizedBox(key: ValueKey('empty_password_conditions')),
        ),
      ],
    );
  }

  Widget _buildToggleVisibilityButton() {
    return IconButton(
      iconSize: 12,
      onPressed: _togglePasswordVisibility,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) => SizeTransition(
          sizeFactor: animation,
          axis: Axis.horizontal,
          axisAlignment: -1.0,
          child: child,
        ),
        child: SvgPicture.asset(
          _isPasswordVisible ? AppIcons.iconsOpenEye : AppIcons.iconsCloseEye,
          key: ValueKey<bool>(_isPasswordVisible),
          colorFilter: ColorFilter.mode(AppColors.grayB6, BlendMode.srcIn),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _updatePasswordConditions(String value) {
    if (value.contains(RegExp(r'[a-z]'))) {
      passwordConditionsState[0] = true;
    } else {
      passwordConditionsState[0] = false;
    }

    if (value.contains(RegExp(r'[A-Z]'))) {
      passwordConditionsState[1] = true;
    } else {
      passwordConditionsState[1] = false;
    }

    if (value.contains(RegExp(r'[0-9]'))) {
      passwordConditionsState[2] = true;
    } else {
      passwordConditionsState[2] = false;
    }
    if (value.contains(RegExp(r'[!@#\$&*~]'))) {
      passwordConditionsState[3] = true;
    } else {
      passwordConditionsState[3] = false;
    }
    if (value.length > 6 && value.length < 30) {
      passwordConditionsState[4] = true;
    } else {
      passwordConditionsState[4] = false;
    }

    setState(() {});
  }
}

OutlineInputBorder customOutLineBorders({
  double? borderRadius,
  Color? borderColor,
  double? borderWidth,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius ?? 12),
    borderSide: BorderSide(
      color: borderColor ?? AppColors.grayE4,
      width: borderWidth ?? 0.5,
    ),
  );
}
