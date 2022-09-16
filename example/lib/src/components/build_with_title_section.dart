import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';

class BuildWithTitleSection extends StatefulWidget {
  const BuildWithTitleSection({Key? key}) : super(key: key);

  @override
  State<BuildWithTitleSection> createState() => _BuildWithTitleSectionState();
}

class _BuildWithTitleSectionState extends State<BuildWithTitleSection> {
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
          title: Text("Home"),
        ),
        CNavItem(
          icon: Icon(Icons.shopping_cart),
          title: Text("Cart"),
        ),
        CNavItem(
          icon: Icon(Icons.lightbulb_outline),
          title: Text("Explore"),
        ),
        CNavItem(
          icon: Icon(Icons.search),
          title: Text("Search"),
        ),
        CNavItem(
          icon: Icon(Icons.account_circle),
          title: Text("Me"),
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
