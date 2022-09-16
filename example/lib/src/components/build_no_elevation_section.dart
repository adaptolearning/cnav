import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';

class BuildNoElevationSection extends StatefulWidget {
  const BuildNoElevationSection({Key? key}) : super(key: key);

  @override
  State<BuildNoElevationSection> createState() =>
      _BuildNoElevationSectionState();
}

class _BuildNoElevationSectionState extends State<BuildNoElevationSection> {
  int _currentIndex = 0;

  final List<int> _badgeCounts = List<int>.generate(5, (index) => index);

  final List<bool> _badgeShows = List<bool>.generate(5, (index) => true);
  @override
  Widget build(BuildContext context) {
    debugPrint("notification");
    return CNav(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.amber,
      unSelectedColor: Colors.black26,
      backgroundColor: Colors.orangeAccent,
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
