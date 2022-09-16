import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';

class BuildFloatingBarSection extends StatefulWidget {
  const BuildFloatingBarSection({Key? key}) : super(key: key);

  @override
  State<BuildFloatingBarSection> createState() =>
      _BuildFloatingBarSectionState();
}

class _BuildFloatingBarSectionState extends State<BuildFloatingBarSection> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CNav(
      margin: const EdgeInsets.all(10),
      iconSize: 30.0,
      selectedColor: Colors.amber,
      strokeColor: Colors.amberAccent,
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      borderRadius: const Radius.circular(20.0),
      items: const [
        CNavItem(
          icon: Icon(Icons.home),
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
