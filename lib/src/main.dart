// Copyright (c) 2021 Yuvraj Sonawane | PRODEVPLUS
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
import 'dart:ui';
import 'dart:math' as math;
import 'package:cnav/cnav.dart';
import 'package:cnav/src/utils/cnav_tile.dart';
import 'package:flutter/material.dart';
import 'package:cnav/src/utils/size_util.dart';
import 'package:cnav/src/animations/beacon_painter.dart';
import 'package:cnav/src/constants/ui/ui_constants.dart';

class CNav extends StatefulWidget {
  CNav({
    Key? key,
    required this.items,
    this.selectedColor,
    this.unSelectedColor,
    this.onTap,
    this.currentIndex = 0,
    this.iconSize = 24.0,
    this.scaleFactor = 0.2,
    this.elevation = 8.0,
    this.borderRadius = Radius.zero,
    this.backgroundColor = Colors.white,
    this.strokeColor = Colors.blueAccent,
    this.bubbleCurve = Curves.linear,
    this.scaleCurve = Curves.linear,
    this.isFloating = false,
    this.blurEffect = false,
    this.opacity = 0.8,
    this.floatingPadding = 0.0,
  })  : assert(scaleFactor <= 0.5, 'Scale factor must smaller than 0.5'),
        assert(scaleFactor > 0, 'Scale factor must bigger than 0'),
        assert(0 <= currentIndex && currentIndex < items.length),
        super(key: key);

  ///
  /// scale factor for the icon scale animation effect.
  /// default is `0.2`.
  final double scaleFactor;

  ///
  /// boolean that control if navigation bar perform floating.
  /// default is false
  ///
  final bool isFloating;

  ///
  /// boolean that control if navigation bar perform floating.
  /// default is false
  ///
  final double floatingPadding;

  ///
  /// Border radius for naviagtion bar
  ///
  final Radius borderRadius;

  /// The z-coordinate of this [CustomNavigationBar].
  ///
  /// If null, defaults to `8.0`.
  final double elevation;

  ///
  /// Item data in [CustomNavigationBarItem]
  ///
  final List<CNavItem> items;

  ///
  /// [Color] when [CustomNavigationBarItem] is selected.
  ///
  /// default color is [blueAccent].
  final Color? selectedColor;

  ///
  /// [Color] when [CustomNavigationBarItem] is not selected.
  ///
  /// default color is [grey[600]].
  final Color? unSelectedColor;

  ///
  /// callback function when item tapped
  ///
  final Function(int)? onTap;

  ///
  /// current index of navigation bar.
  ///
  final int currentIndex;

  ///
  /// size of icon.
  /// also represent the max radius of bubble effect animation.
  final double iconSize;

  ///
  /// Background color of [CustomNavigationBar]
  ///
  final Color backgroundColor;

  ///
  /// stroke color.
  /// default is [Colors.blueAccent].
  final Color strokeColor;

  ///
  /// animation curve of bubble effect
  ///
  final Curve bubbleCurve;

  ///
  /// animation curve of scale effect
  ///
  final Curve scaleCurve;

  ///
  /// bool to control if navigation bar use blur effect
  /// default is [false]
  ///
  final bool blurEffect;

  ///
  /// When [blurEffect] is [true], control the opacity of navigation bar
  /// default is [0.8]
  ///
  final double opacity;

  @override
  _CNavState createState() => _CNavState();
}

class _CNavState extends State<CNav> with TickerProviderStateMixin {
  late List<double> _radiuses;
  late List<double> _sizes;
  late AnimationController _controller;
  late AnimationController _scaleController;

  double _bubbleRadius = 0.0;
  late double _maxRadius;

  double _itemPadding = 0.0;

  @override
  void initState() {
    super.initState();
    _bubbleRadius = 0.0;
    _radiuses = List<double>.generate(widget.items.length, (index) {
      return _bubbleRadius;
    });

    _sizes = List<double>.generate(widget.items.length, (index) {
      return 0.0;
    });
    _maxRadius = widget.iconSize;
  }

  @override
  void dispose() {
    if (_controller != null) _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      _startAnimation(widget.currentIndex);
      _startScale(widget.currentIndex);
    }
  }

  void _startAnimation(int index) {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    CurvedAnimation _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.bubbleCurve,
    );
    Tween<double>(begin: 0.0, end: 1.0).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {
          _radiuses[index] = _maxRadius * _curvedAnimation.value;
        });
      });
    _controller.forward();
  }

  void _startScale(int index) {
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleController.reverse();
        }
      });
    CurvedAnimation _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: widget.scaleCurve,
      reverseCurve: widget.scaleCurve.flipped,
    );

    Tween<double>(begin: 0.0, end: 1.0).animate(_scaleAnimation)
      ..addListener(() {
        setState(() {
          _sizes[index] = _scaleAnimation.value * widget.scaleFactor;
        });
      });
    _scaleController.forward();
  }

  Widget _buildLabel(int index) {
    // unselected
    if (index != widget.currentIndex) {
      if (widget.items[index].title == null && widget.isFloating) {
        return SizedBox();
      } else {
        return widget.items[index].title ?? Text('');
      }
    } else {
      //selected
      if (widget.isFloating && widget.items[index].title == null) {
        return SizedBox();
      } else {
        return widget.items[index].selectedTitle ?? Text('');
      }
    }
  }

  Widget _buildIcon(int index) {
    return SizedBox(
      height: widget.iconSize,
      width: widget.iconSize,
      child: CustomPaint(
        painter: BeaconPainter(
            color: widget.strokeColor,
            beaconRadius: _radiuses[index],
            maxRadius: _maxRadius,
            offset: Offset(
              widget.iconSize / 2,
              widget.iconSize / 2,
            )),
        child: CNavTile(
          iconSize: widget.iconSize,
          scale: _sizes[index],
          selected: index == widget.currentIndex,
          item: widget.items[index],
          selectedColor: widget.selectedColor ?? KUi.colors.defaultColor,
          unSelectedColor:
              widget.unSelectedColor ?? KUi.colors.defaultUnSelectedColor,
          iconPadding: _itemPadding,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeUtil().init(context);
    final double additionalBottomPadding =
        math.max(MediaQuery.of(context).padding.bottom, 0.0);

    final height = KUi.measurements.defaultHeight +
        (widget.isFloating ? 0.0 : additionalBottomPadding);

    _itemPadding = (MediaQuery.of(context).size.width -
            widget.items.length * widget.iconSize) /
        (widget.items.length * 2);

    if (widget.isFloating) {
      _itemPadding = (MediaQuery.of(context).size.width -
              widget.items.length * widget.iconSize -
              32) /
          (widget.items.length * 2);
    }

    Widget bar = Material(
      color: widget.backgroundColor,
      elevation: widget.elevation,
      borderRadius: BorderRadius.all(widget.borderRadius),
      child: Container(
        height: height,
        width: SizeUtil.screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List<Widget>.generate(
            widget.items.length,
            (i) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                widget.onTap!(i);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIcon(i),
                  _buildLabel(i),
                ],
              ),
            ),
          ).toList(),
        ),
      ),
    );

    if (widget.blurEffect) {
      return Padding(
        padding: widget.isFloating
            ? EdgeInsets.only(
                left: getProportionateScreenWidth(widget.floatingPadding),
                right: getProportionateScreenWidth(widget.floatingPadding),
                top: 0,
                bottom: additionalBottomPadding,
              )
            : EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.all(widget.borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 10.0,
            ),
            child: Opacity(
              opacity: 0.6,
              child: bar,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: widget.isFloating
            ? EdgeInsets.only(
                left: getProportionateScreenWidth(widget.floatingPadding),
                right: getProportionateScreenWidth(widget.floatingPadding),
                top: 0,
                bottom: additionalBottomPadding,
              )
            : EdgeInsets.zero,
        child: bar,
      );
    }
  }
}
