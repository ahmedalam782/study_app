import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';
import '../theme/styles.dart';

class PopupHelper {
  static Future<void> showCustomPopupMenu({
    required BuildContext context,
    required Offset position,
    required List<DialogItem> items,
    String? menuTitle,
    bool withIcons = true,
    bool rightAligned = false,
    bool center = false,
    bool recolorIcons = true,
    double? radius,
    double? width,
    Color? backgroundColor,
  }) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromDirectional(
        textDirection: Directionality.of(context) == TextDirection.ltr
            ? TextDirection.rtl
            : TextDirection.ltr,
        start: position.dx,
        top: position.dy - 105,
        end: position.dx + 1,
        bottom: position.dy + 1,
      ),
      color: backgroundColor ?? AppColors.white,
      shadowColor: AppColors.black.withValues(alpha: 0.5),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: radius != null
            ? BorderRadiusGeometry.circular(radius)
            : BorderRadiusDirectional.only(
                topStart: Radius.circular(12),
                topEnd: Radius.circular(0),
                bottomStart: Radius.circular(12),
                bottomEnd: Radius.circular(12),
              ),
      ),
      constraints: BoxConstraints(maxWidth: width ?? 200),
      menuPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      items: <PopupMenuEntry<dynamic>>[
        if (menuTitle != null)
          PopupMenuItem<dynamic>(
            enabled: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(menuTitle, style: Styles.medium(context, 16)),
            ),
          ),
        for (int i = 0; i < items.length; i++) ...[
          PopupMenuItem<dynamic>(
            onTap: items[i].onTap,

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (withIcons &&
                    items[i].iconPath != null &&
                    items[i].iconPath!.isNotEmpty)
                  SvgPicture.asset(
                    items[i].iconPath!,
                    width: 20,
                    colorFilter: recolorIcons
                        ? ColorFilter.mode(
                            items[i].iconColor ?? AppColors.gray71,
                            BlendMode.srcIn,
                          )
                        : null,
                    fit: BoxFit.scaleDown,
                  ),
                if (items[i].title != null)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: Text(
                      items[i].title!,
                      style: Styles.regular(
                        context,
                        14,
                      ).copyWith(color: items[i].iconColor ?? AppColors.gray52),
                    ),
                  ),
              ],
            ),
          ),
          if (i < items.length - 1)
            const PopupMenuDivider(height: 0.5, color: AppColors.grayD9),
        ],
      ],
    );
  }
}

class DialogItem {
  final String? title;
  final String? iconPath;
  final Color? iconColor;
  final VoidCallback? onTap;

  DialogItem({this.title, this.iconPath, this.iconColor, this.onTap});
}
