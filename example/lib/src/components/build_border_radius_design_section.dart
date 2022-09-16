import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';

class BuildBorderRadiusDesignSection extends StatefulWidget {
  const BuildBorderRadiusDesignSection({Key? key}) : super(key: key);

  @override
  State<BuildBorderRadiusDesignSection> createState() =>
      _BuildBorderRadiusDesignSectionState();
}

class _BuildBorderRadiusDesignSectionState
    extends State<BuildBorderRadiusDesignSection> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CNav(
      margin: const EdgeInsets.all(10),
      iconSize: 30.0,
      selectedColor: Colors.pinkAccent,
      strokeColor: Colors.pink,
      unSelectedColor: Colors.amber,
      backgroundColor: Colors.white,
      borderRadius: const Radius.circular(50.0),
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
    );
  }
}
