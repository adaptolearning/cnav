import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';
import 'package:cnav/src/utils/badge_text.dart';

class CNavTile extends StatelessWidget {
  const CNavTile({
    Key? key,
    this.selected,
    required this.item,
    this.selectedColor,
    this.unSelectedColor,
    this.scale,
    this.iconSize,
    this.iconPadding,
  }) : super(key: key);

  final bool? selected;

  final CNavItem item;

  final Color? selectedColor;

  final Color? unSelectedColor;

  final double? scale;

  final double? iconSize;

  final double? iconPadding;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.0 + (scale ?? 0.0),
      child: Stack(
        children: [
          Center(
            child: IconTheme(
              data: IconThemeData(
                color: (selected ?? false) ? selectedColor : unSelectedColor,
                size: iconSize,
              ),
              child: (selected ?? false) ? item.selectedIcon! : item.icon,
            ),
          ),
          BadgeText(
            show: item.showBadge,
            count: item.badgeCount,
            right: 0.0,
          )
        ],
      ),
    );
  }
}
