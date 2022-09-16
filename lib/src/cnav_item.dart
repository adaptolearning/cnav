import 'package:flutter/material.dart';

class CNavItem {
  final Widget icon;
  final Widget? selectedIcon;
  final Widget? title;
  final Widget? selectedTitle;
  final int badgeCount;
  final bool showBadge;

  const CNavItem({
    required this.icon,
    this.title,
    Widget? selectedIcon,
    Widget? selectedTitle,
    this.badgeCount = 0,
    this.showBadge = false,
  })  : selectedIcon = selectedIcon ?? icon,
        selectedTitle = selectedTitle ?? title;
}
