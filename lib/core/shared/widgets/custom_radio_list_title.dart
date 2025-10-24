import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:study_app/core/theme/app_colors.dart';
import 'package:study_app/core/theme/styles.dart';

class CustomRadioListTitle<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final String? title, icon;
  final Color? tileColor;
  final double radius;
  final AlignmentGeometry titleAlignment;
  const CustomRadioListTitle({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.icon,
    this.tileColor = AppColors.grayF4,
    this.radius = 12,
    this.titleAlignment = AlignmentDirectional.centerStart,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return Material(
      color: tileColor, // Move the background color to Material
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: () => onChanged(value),
        hoverColor: AppColors.primaryLight,
        splashColor: AppColors.primaryLight.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            // Remove the color from here - it's now on Material
          ),
          child: Row(
            spacing: 8,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    icon!,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      AppColors.gray71,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              Expanded(
                child: Align(
                  alignment: titleAlignment,
                  child: Text(
                    title ?? "",
                    style: Styles.regular(
                      context,
                      14,
                    ).copyWith(color: AppColors.gray71),
                  ),
                ),
              ),
              // Remove the nested InkWell for the radio button to avoid conflicts
              AnimatedContainer(
                duration: Duration(milliseconds: 250),
                margin: EdgeInsets.symmetric(horizontal: 4),
                curve: Curves.easeInOut,
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryLight
                        : AppColors.grayE4,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: isSelected
                        ? Container(
                            key: ValueKey('selected'),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppColors.primaryGradient,
                            ),
                          )
                        : SizedBox(
                            key: ValueKey('unselected'),
                            width: 8,
                            height: 8,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
