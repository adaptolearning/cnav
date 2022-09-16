import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';

class BuildLightSection extends StatefulWidget {
  const BuildLightSection({Key? key}) : super(key: key);

  @override
  State<BuildLightSection> createState() => _BuildLightSectionState();
}

class _BuildLightSectionState extends State<BuildLightSection> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CNav(
      iconSize: 30.0,
      margin: const EdgeInsets.all(20),
      borderRadius: const Radius.circular(10),
      selectedColor: const Color(0xff040307),
      strokeColor: const Color(0x30040307),
      unSelectedColor: const Color(0xffacacac),
      backgroundColor: Colors.white,
      items: const [
        CNavItem(
          icon: Icon(Icons.home),
        ),
        CNavItem(
          icon: Icon(Icons.shopping_cart),
        ),
        CNavItem(
          icon: Icon(Icons.lightbulb_outline),
        ),
        CNavItem(
          icon: Icon(Icons.search),
        ),
        CNavItem(
          icon: Icon(Icons.account_circle),
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
