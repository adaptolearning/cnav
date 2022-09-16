import 'package:cnav/cnav.dart';
import 'package:flutter/material.dart';

class BuildOriginDesignSection extends StatefulWidget {
  const BuildOriginDesignSection({Key? key}) : super(key: key);

  @override
  State<BuildOriginDesignSection> createState() =>
      _BuildOriginDesignSectionState();
}

class _BuildOriginDesignSectionState extends State<BuildOriginDesignSection> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CNav(
      iconSize: 30.0,
      margin: const EdgeInsets.all(20),
      borderRadius: const Radius.circular(10),
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: const Color(0xff6c788a),
      backgroundColor: const Color(0xff040307),
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
