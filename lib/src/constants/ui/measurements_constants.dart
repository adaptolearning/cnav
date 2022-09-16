import 'package:flutter/material.dart';

class KMeasurements {
  final double defaultHeight;
  final double padding;
  final double hPadding;
  final double vPadding;
  final double margin;
  final double hMargin;
  final double vMargin;
  final double offset;
  final double scaleFactor;
  final double elevation;
  final Radius borderRadius;
  final double opacity;
  final double iconSize;
  final bool blurEffect;
  final bool isFloating;
  final Curve bubbleCurve;
  final Curve scaleCurve;
  const KMeasurements()
      : defaultHeight = kBottomNavigationBarHeight,
        padding = 20.0,
        hPadding = 20.0,
        vPadding = 20.0,
        margin = 20.0,
        hMargin = 20.0,
        vMargin = 20.0,
        offset = 12,
        scaleFactor = 0.2,
        elevation = 8.0,
        borderRadius = Radius.zero,
        opacity = 0.8,
        iconSize = 24.0,
        blurEffect = false,
        isFloating = false,
        bubbleCurve = Curves.linear,
        scaleCurve = Curves.linear;
}
