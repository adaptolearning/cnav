import 'package:flutter/material.dart';

class SizeUtil {
  static MediaQueryData? _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static Orientation? orientation;
  static double constWidth = 414.0; // 414 is the layout width that designer use
  static double constHeight =
      896.0; // 896 is the layout height that designer use

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
} // end-size-util-class

// Get the proportionate height as per the screen size
bool isSmallDevice() {
  if ((SizeUtil.screenHeight < 700)) {
    return true;
  } else {
    return false;
  }
}

// Get the proportionate height as per the screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeUtil.screenHeight;
  return (inputHeight / SizeUtil.constHeight) * screenHeight;
}

// Get the proportionate width as per the screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeUtil.screenWidth;
  return (inputWidth / SizeUtil.constWidth) * screenWidth;
}
