import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';

class BuildBlurEffectSection extends StatefulWidget {
  const BuildBlurEffectSection({Key? key}) : super(key: key);

  @override
  State<BuildBlurEffectSection> createState() => _BuildBlurEffectSectionState();
}

class _BuildBlurEffectSectionState extends State<BuildBlurEffectSection> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CNav(
      margin: const EdgeInsets.all(10),
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.black,
      borderRadius: const Radius.circular(20.0),
      blurEffect: true,
      opacity: 0.8,
      items: const [
        CNavItem(
          icon: Icon(
            Icons.home,
          ),
        ),
        CNavItem(
          icon: Icon(Icons.shopping_bag),
        ),
        CNavItem(
          icon: Icon(Icons.cloud),
        ),
        CNavItem(
          icon: Icon(
            Icons.search,
          ),
        ),
        CNavItem(
          icon: Icon(
            Icons.person,
          ),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      isFloating: true,
    );
  }
}
