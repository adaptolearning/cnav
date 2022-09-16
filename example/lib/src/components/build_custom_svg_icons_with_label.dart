import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildCustomSvgIconsWithLabelsSection extends StatefulWidget {
  const BuildCustomSvgIconsWithLabelsSection({Key? key}) : super(key: key);

  @override
  State<BuildCustomSvgIconsWithLabelsSection> createState() =>
      _BuildCustomSvgIconsWithLabelsSectionState();
}

class _BuildCustomSvgIconsWithLabelsSectionState
    extends State<BuildCustomSvgIconsWithLabelsSection> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CNav(
      iconSize: 30.0,
      margin: const EdgeInsets.all(20),
      borderRadius: const Radius.circular(10),
      strokeColor: const Color(0x300c18fb),
      backgroundColor: Colors.white,
      items: [
        CNavItem(
          title: const Text('Home'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/home.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/home.svg",
            color: Colors.pinkAccent,
          ),
        ),
        CNavItem(
          title: const Text('Shopping'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/shopping-bag.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/shopping-bag.svg",
            color: Colors.pinkAccent,
          ),
        ),
        CNavItem(
          title: const Text('Cloud'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/cloud.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/cloud.svg",
            color: Colors.pinkAccent,
          ),
        ),
        CNavItem(
          title: const Text('Search'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/magnifying-glass.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/magnifying-glass.svg",
            color: Colors.pinkAccent,
          ),
        ),
        CNavItem(
          title: const Text('Profile'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/user.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/user.svg",
            color: Colors.pinkAccent,
          ),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
