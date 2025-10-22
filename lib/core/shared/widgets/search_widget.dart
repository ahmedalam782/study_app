import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:study_app/core/helper/classes/debouncer.dart';
import 'package:study_app/core/helper/datetime_helper/date_time_helper.dart';
import 'package:study_app/core/helper/datetime_helper/date_time_picker.dart';
import 'package:study_app/core/shared/widgets/custom_text_field.dart';
import 'package:study_app/core/theme/app_colors.dart';
import 'package:study_app/core/theme/app_icons.dart';
import 'package:study_app/core/theme/styles.dart';
import 'package:study_app/core/utils/constants/app_numbers.dart';
import 'package:study_app/generated/lib/core/languages/locale_keys.g.dart';


class SearchWidget extends StatefulWidget {
  final Function(String?)? onSearchChanged;
  final String title;
  final bool showBackButton;
  final bool showStatusDropButton;
  final void Function()? onAddReviewer;
  final void Function()? onBackButtonTap;
  final void Function(String? selectedValue)? onChangedStatus;
  final void Function(DateTimeRange<DateTime>? selectedRange)?
  onDateRangeSelected;
  final DateTimeRange<DateTime>? dateRange;

  const SearchWidget({
    super.key,
    this.onSearchChanged,
    required this.title,
    this.onAddReviewer,
    this.showBackButton = false,
    this.onBackButtonTap,
    this.showStatusDropButton = true,
    this.onChangedStatus,
    this.dateRange,
    this.onDateRangeSelected,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String _animatedHintText = '';
  int _hintIndex = 0;
  bool _typingForward = true;
  Timer? _typewriterTimer;
  late TextEditingController _searchController;
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _debouncer = Debouncer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _startTypewriterAnimation();
  }

  void _startTypewriterAnimation() {
    _typewriterTimer?.cancel();
    final fullText = 'global.search_hint'.tr();
    const typeSpeed = Duration(milliseconds: 60);
    const pauseDuration = Duration(seconds: 5);
    _typewriterTimer = Timer.periodic(typeSpeed, (timer) {
      if (_typingForward) {
        if (_hintIndex < fullText.length) {
          setState(() {
            _hintIndex++;
            _animatedHintText = fullText.substring(0, _hintIndex);
          });
        } else {
          _typingForward = false;
          timer.cancel();
          Future.delayed(pauseDuration, () {
            if (mounted) {
              setState(() {
                _hintIndex = 0;
                _animatedHintText = '';
                _typingForward = true;
              });
              _startTypewriterAnimation();
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _typewriterTimer?.cancel();
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool convertToTabletMode =
            constraints.maxWidth > (AppNumbers.kTabletMaxWidth - 1);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Row(
                spacing: 12,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 450),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: widget.showBackButton
                        ? IconButton(
                            onPressed: widget.onBackButtonTap,
                            icon: Icon(Icons.arrow_back_ios_rounded),
                          )
                        : SizedBox.shrink(),
                  ),
                  if (convertToTabletMode)
                    Text(widget.title, style: Styles.regular(context, 20)),
                  if (convertToTabletMode) Spacer(),
                  Flexible(
                    flex: convertToTabletMode ? 0 : 1,
                    child: SizedBox(
                      width: !convertToTabletMode
                          ? null
                          : 354.w.clamp(200, 354),
                      child: CustomTextFormField(
                        hintText: _animatedHintText.isEmpty
                            ? LocaleKeys.global_search_hint.tr()
                            : _animatedHintText,
                        controller: _searchController,
                        onChanged: (value) {
                          _debouncer.call(() {
                            widget.onSearchChanged?.call(value);
                          });
                        },
                        onFieldSubmitted: (value) =>
                            widget.onSearchChanged?.call(value),
                        textStyle: Styles.light(context, 16),
                        prefixIcon: AppIcons.iconsSearch,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () async {
                      final DateTimeRange<DateTime>? pickedRange =
                          await pickDateRange(
                            context: context,
                            initialDateRange: widget.dateRange,
                            lastDate: DateTime(2100),
                            firstDate: null,
                            confirmText: "home.search".tr(),
                            isWeb: !convertToTabletMode,
                          );
                      if (pickedRange != null) {
                        widget.onDateRangeSelected?.call(pickedRange);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 13.5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white,
                        border: Border.all(color: AppColors.grayE4, width: 0.5),
                      ),
                      child: Row(
                        spacing: 9.88,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.dateRange != null
                                ? "${DateTimeHelper.reformatDate(widget.dateRange!.start.toString())} - ${DateTimeHelper.reformatDate(widget.dateRange!.end.toString())}"
                                : "global.filter_hint".tr(),
                            style: Styles.light(context, 14).copyWith(
                              color: AppColors.gray71,
                            ),
                          ),
                          SvgPicture.asset(
                            AppIcons.iconsCalendar,
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              AppColors.gray52,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (!convertToTabletMode)
                Text(widget.title, style: Styles.regular(context, 20)),
            ],
          ),
        );
      },
    );
  }
}
