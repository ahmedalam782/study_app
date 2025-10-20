import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/styles.dart';

class StatisticsItem extends StatelessWidget {
  final String title, icon, value;
  const StatisticsItem({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff6E64AD), Color(0xff9747FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Container(
            width: 56.w.clamp(46, 62),
            height: 56.w.clamp(46, 62),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.originalWhite.withValues(alpha: 0.07),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 32.w.clamp(22, 38),
                height: 32.w.clamp(22, 38),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    value,
                    style: Styles.bold18.copyWith(
                      color: AppColors.originalWhite,
                    ),
                  ),
                ),
                Text(
                  title.tr(),
                  style: Styles.regular12.copyWith(
                    color: AppColors.originalWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
