import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/styles.dart';

class CustomCheckListTile extends StatelessWidget {
  final bool value;
  final void Function(bool? value)? onChanged;
  final String? title;
  final Color? tileColor;
  final double radius;
  final AlignmentGeometry titleAlignment;
  const CustomCheckListTile({
    super.key,
    required this.value,
    this.onChanged,
    this.title,
    this.tileColor,
    required this.radius,
    required this.titleAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: tileColor,
        ),
        child: Row(
          spacing: 8,
          children: [
            Expanded(
              child: Align(
                alignment: titleAlignment,
                child: Text(
                  title ?? "",
                  style: Styles.regular(
                    context,
                    16,
                  ).copyWith(color: AppColors.gray71),
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 250),

              curve: Curves.easeInOut,
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: value
                    ? null
                    : Border.all(color: AppColors.gray71, width: 2),

                gradient: value ? AppColors.primaryGradient : null,
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: value
                      ? SvgPicture.asset(
                          AppIcons.iconsCheckmark,
                          key: ValueKey('selected'),
                          width: 14,
                          height: 14,
                        )
                      : SizedBox(
                          key: ValueKey('unselected'),
                          width: 14,
                          height: 14,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
