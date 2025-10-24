import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:study_app/core/languages/lang.dart';
import 'package:study_app/core/languages/locale_keys.g.dart';
import 'package:study_app/core/theme/scroll_bar_theme.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/styles.dart';
import 'custom_text_field.dart';

class CustomDropButton extends StatefulWidget {
  const CustomDropButton({
    super.key,
    required this.items,
    this.value,
    required this.onChanged,
    this.hint,
    this.validator,
    this.withUpdate = true,
    this.headerTextStyle,
    this.spacing = 0,
    this.radius = 8,
    this.borderColor = AppColors.grayE4,
    this.height,
    this.enabled = true,
    this.icon,
    this.recolorIcon = true,
    this.preferLazyModal = false,
    this.enableSearchInModal = false,
    this.searchHint,
    this.isWeb = false,
  });
  final List<DropdownMenuItem<String>> items;
  final String? value;
  final void Function(String? selectedValue)? onChanged;
  final String? hint, icon;
  final String? Function(dynamic value)? validator;
  final bool withUpdate, enabled, recolorIcon, isWeb;
  final double? spacing, radius, height;
  final TextStyle? headerTextStyle;
  final Color borderColor;

  final bool preferLazyModal;
  final bool enableSearchInModal;
  final String? searchHint;

  @override
  State<CustomDropButton> createState() => _CustomDropButtonState();
}

class _CustomDropButtonState extends State<CustomDropButton> {
  String? _localValue; // for immediate UI feedback in modal mode

  @override
  void didUpdateWidget(covariant CustomDropButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If parent value changes, sync local
    if (widget.value != oldWidget.value) {
      _localValue = widget.value;
    }
  }

  String? _labelForValue(String? v) {
    if (v == null) return null;
    for (final item in widget.items) {
      if (item.value == v) {
        final child = item.child;
        if (child is Text) return child.data;
        // Fallback: not a Text, return value
        return v;
      }
    }
    return v;
  }

  Future<void> _openModalPicker() async {
    if (!widget.enabled) return;
    final selectedBefore = _localValue ?? widget.value;
    String? result;

    if (widget.isWeb && widget.preferLazyModal) {
      // Show dialog on web with same UI as bottom sheet
      result = await showDialog<String>(
        context: context,
        barrierDismissible: true,
        barrierColor: AppColors.black.withValues(alpha: 0.1),

        builder: (ctx) {
          List<DropdownMenuItem<String>> filtered = widget.items;
          final controller = TextEditingController();
          return StatefulBuilder(
            builder: (context, setSB) {
              final size = MediaQuery.of(context).size;
              double dialogWidth = size.width * 0.9;
              if (dialogWidth > 640) dialogWidth = 640;
              double dialogHeight = size.height * 0.85;
              if (dialogHeight > 560) dialogHeight = 560;
              return AlertDialog(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(color: AppColors.grayE4),
                ),
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                contentPadding: EdgeInsets.zero,
                content: SizedBox(
                  width: dialogWidth,
                  height: dialogHeight,
                  child: Column(
                    children: [
                      if (widget.enableSearchInModal)
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomTextFormField(
                            controller: controller,
                            hintText:
                                widget.searchHint ??
                                LocaleKeys.custom_widget_search.tr(),
                            suffixWidget: SvgPicture.asset(
                              AppIcons.iconsSearch,
                              width: 24,
                              height: 24,
                              fit: BoxFit.scaleDown,
                            ),
                            textDirection: TextDirection.ltr,

                            onChanged: (q) {
                              final query = q!.trim().toLowerCase();
                              setSB(() {
                                filtered = widget.items.where((e) {
                                  final w = e.child;
                                  String text = '';
                                  if (w is Text) {
                                    text = w.data ?? '';
                                  } else {
                                    text = e.value ?? '';
                                  }
                                  return text.toLowerCase().contains(query);
                                }).toList();
                              });
                            },
                          ),
                        ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ScrollConfiguration(
                            behavior: NoScrollbarBehavior(),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: filtered.length,
                                itemBuilder: (context, index) {
                                  final item = filtered[index];
                                  final isSelected =
                                      item.value == selectedBefore;
                                  return ListTile(
                                    title: item.child,
                                    titleAlignment:
                                        ListTileTitleAlignment.center,
                                    selectedTileColor: AppColors.primaryLight,
                                    selected: isSelected,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    onTap: () => context.canPop()
                                        ? context.pop(item.value)
                                        : null,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    } else {
      result = await showModalBottomSheet<String>(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (ctx) {
          List<DropdownMenuItem<String>> filtered = widget.items;
          final controller = TextEditingController();
          return StatefulBuilder(
            builder: (context, setSB) {
              return DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.6,
                maxChildSize: 0.9,
                minChildSize: 0.4,
                builder: (context, scrollController) {
                  return Column(
                    children: [
                      if (widget.enableSearchInModal)
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomTextFormField(
                            controller: controller,
                            hintText:
                                widget.searchHint ??
                                LocaleKeys.custom_widget_search.tr(),
                            prefixIcon: AppIcons.iconsSearch,
                            onChanged: (q) {
                              final query = q!.trim().toLowerCase();
                              setSB(() {
                                filtered = widget.items.where((e) {
                                  final w = e.child;
                                  String text = '';
                                  if (w is Text) {
                                    text = w.data ?? '';
                                  } else {
                                    text = e.value ?? '';
                                  }
                                  return text.toLowerCase().contains(query);
                                }).toList();
                              });
                            },
                          ),
                        ),
                      Expanded(
                        child: Scrollbar(
                          thumbVisibility: true,
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ScrollConfiguration(
                              behavior: NoScrollbarBehavior(),
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: filtered.length,
                                itemBuilder: (context, index) {
                                  final item = filtered[index];
                                  final isSelected =
                                      item.value == selectedBefore;
                                  return ListTile(
                                    title: item.child,
                                    selectedTileColor: AppColors.primaryLight,
                                    selected: isSelected,
                                    titleAlignment:
                                        ListTileTitleAlignment.center,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    onTap: () => context.canPop()
                                        ? context.pop(item.value)
                                        : null,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      );
    }
    if (result != null) {
      setState(() => _localValue = result);
      widget.onChanged?.call(result);
    }
  }

  InputDecoration _decoration(BuildContext context) {
    return InputDecoration(
      prefixIconConstraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      fillColor: widget.enabled ? AppColors.white : AppColors.grayFD,
      filled: true,
      focusColor: AppColors.white,
      errorStyle: TextStyle(
        fontFamily: context.locale.languageCode == 'ar'
            ? LanguageHelper.arabicFontFamily
            : LanguageHelper.englishFontFamily,
        color: AppColors.errorLight,
        fontSize: 12,
      ),
      hoverColor: widget.enabled ? AppColors.white : Colors.transparent,
      errorMaxLines: 4,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius!),
        borderSide: const BorderSide(color: AppColors.errorLight, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius!),
        borderSide: BorderSide(color: widget.borderColor, width: 0.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius!),
        borderSide: BorderSide(color: widget.borderColor, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius!),
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentValue = _localValue ?? widget.value;
    final selectedLabel = _labelForValue(currentValue);

    if (!widget.preferLazyModal) {
      // Original dropdown path
      return SizedBox(
        height: widget.height,
        child: DropdownButtonFormField(
          items: widget.items,
          key: widget.withUpdate ? null : UniqueKey(),
          initialValue: widget.value,
          menuMaxHeight: 240,
          onChanged: widget.enabled ? widget.onChanged : null,
          isExpanded: true,
          autofocus: false,
          validator: widget.validator,
          alignment: AlignmentDirectional.topStart,
          hint: Text(
            widget.hint ?? "",
            style: Styles.light(context, 14).copyWith(
              color: widget.enabled ? AppColors.gray71 : AppColors.grayB6,
            ),
          ),

          icon: SvgPicture.asset(
            AppIcons.iconsDownArrow,
            colorFilter: ColorFilter.mode(
              widget.enabled ? AppColors.gray71 : AppColors.grayB6,
              BlendMode.srcIn,
            ),
            fit: BoxFit.scaleDown,
          ),
          decoration: _decoration(context),
          elevation: 9,
          borderRadius: BorderRadius.circular(widget.radius!),
          dropdownColor: AppColors.white,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          style: TextStyle(
            fontFamily: context.locale.languageCode == 'ar'
                ? LanguageHelper.arabicFontFamily
                : LanguageHelper.englishFontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: AppColors.gray71,
            height: 1.6,
          ),
        ),
      );
    }

    // Lazy modal path for large datasets
    return FormField<String>(
      validator: widget.validator,
      initialValue: currentValue,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: widget.enabled ? _openModalPicker : null,
              child: InputDecorator(
                isEmpty: (selectedLabel == null || selectedLabel.isEmpty),
                decoration: _decoration(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8.0),
                        child: SvgPicture.asset(
                          widget.icon!,
                          width: 20,
                          height: 20,
                          fit: BoxFit.scaleDown,
                          colorFilter: widget.recolorIcon
                              ? const ColorFilter.mode(
                                  AppColors.gray71,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                      ),
                    Expanded(
                      child: Text(
                        selectedLabel ?? (widget.hint ?? ''),
                        style: Styles.light(context, 14).copyWith(
                          color: widget.enabled
                              ? AppColors.gray71
                              : AppColors.grayB6,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SvgPicture.asset(
                      AppIcons.iconsDownArrow,
                      colorFilter: ColorFilter.mode(
                        widget.enabled ? AppColors.gray71 : AppColors.grayB6,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 12, top: 4),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                    fontFamily: context.locale.languageCode == 'ar'
                        ? LanguageHelper.arabicFontFamily
                        : LanguageHelper.englishFontFamily,
                    color: AppColors.errorLight,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
