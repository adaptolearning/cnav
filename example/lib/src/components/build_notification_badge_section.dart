import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';

class BuildNotificationBadgeSection extends StatefulWidget {
  const BuildNotificationBadgeSection({Key? key}) : super(key: key);

  @override
  State<BuildNotificationBadgeSection> createState() =>
      _BuildNotificationBadgeSectionState();
}

class _BuildNotificationBadgeSectionState
    extends State<BuildNotificationBadgeSection> {
  int _currentIndex = 0;

  final List<int> _badgeCounts = List<int>.generate(5, (index) => index);

  final List<bool> _badgeShows = List<bool>.generate(5, (index) => true);
  @override
  Widget build(BuildContext context) {
    debugPrint("notification");
    return CNav(
      iconSize: 30.0,
      selectedColor: const Color(0xff040307),
      strokeColor: const Color(0x30040307),
      unSelectedColor: const Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
        CNavItem(
          icon: const Icon(Icons.home),
          badgeCount: _badgeCounts[0],
          showBadge: _badgeShows[0],
        ),
        CNavItem(
          icon: const Icon(Icons.shopping_bag),
          badgeCount: _badgeCounts[1],
          showBadge: _badgeShows[1],
        ),
        CNavItem(
          icon: const Icon(Icons.lightbulb_outline),
          badgeCount: _badgeCounts[2],
          showBadge: _badgeShows[2],
        ),
        CNavItem(
          icon: const Icon(Icons.search),
          badgeCount: _badgeCounts[3],
          showBadge: _badgeShows[3],
        ),
        CNavItem(
          icon: const Icon(Icons.account_circle),
          badgeCount: _badgeCounts[4],
          showBadge: _badgeShows[4],
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _badgeShows[index] = false;
        });
      },
    );
  }
}
