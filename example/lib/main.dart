// Copyright (c) 2020 Yuvraj Sonawane | PRODEVPLUS
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

import 'package:example/src/components/build_custom_svg_icons.dart';
import 'package:example/src/components/build_floating_bar_section.dart';
import 'package:example/src/components/build_light_section.dart';
import 'package:example/src/components/build_notification_badge_section.dart';
import 'package:example/src/components/build_origin_design_section.dart';
import 'package:example/src/components/build_with_title_section.dart';
import 'package:flutter/material.dart';

import 'src/components/build_with_and_without_label_section.dart';
import 'src/components/build_blur_effect_section.dart';
import 'src/components/build_border_radius_design_section.dart';
import 'src/components/build_custom_svg_icons_with_label.dart';
import 'src/components/build_no_elevation_section.dart';

void main() => runApp(const MyApp());

enum ThemeStyle {
  dribbble,
  light,
  noElevation,
  svgIcons,
  svgIconsWithTitle,
  borderRadius,
  floatingBar,
  notificationBadge,
  withTitle,
  withAndWithoutLabel,
  blurEffect
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navigation Bar Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'CNav Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeStyle? _currentStyle = ThemeStyle.notificationBadge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody for floating bar get better performance
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(widget.title ?? "")),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Dribbble Inspiration Version'),
              leading: Radio(
                value: ThemeStyle.dribbble,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Notification badge'),
              leading: Radio(
                value: ThemeStyle.notificationBadge,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Light'),
              leading: Radio(
                value: ThemeStyle.light,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('No elevation'),
              leading: Radio(
                value: ThemeStyle.noElevation,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Custom Svg Icon (Heroicons 2)'),
              leading: Radio(
                value: ThemeStyle.svgIcons,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Custom Svg Icon with Labels (Heroicons 2)'),
              leading: Radio(
                value: ThemeStyle.svgIconsWithTitle,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('With border radius'),
              leading: Radio(
                value: ThemeStyle.borderRadius,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Floating Bar'),
              leading: Radio(
                value: ThemeStyle.floatingBar,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('With Title'),
              leading: Radio(
                value: ThemeStyle.withTitle,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('With and Without Label'),
              leading: Radio(
                value: ThemeStyle.withAndWithoutLabel,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Blur Effect'),
              leading: Radio(
                value: ThemeStyle.blurEffect,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    switch (_currentStyle) {
      case ThemeStyle.dribbble:
        return const BuildOriginDesignSection();
      case ThemeStyle.light:
        return const BuildLightSection();
      case ThemeStyle.svgIcons:
        return const BuildCustomSvgIconsSection();
      case ThemeStyle.svgIconsWithTitle:
        return const BuildCustomSvgIconsWithLabelsSection();
      case ThemeStyle.borderRadius:
        return const BuildBorderRadiusDesignSection();
      case ThemeStyle.floatingBar:
        return const BuildFloatingBarSection();
      case ThemeStyle.noElevation:
        return const BuildNoElevationSection();
      case ThemeStyle.notificationBadge:
        return const BuildNotificationBadgeSection();
      case ThemeStyle.withTitle:
        return const BuildWithTitleSection();
      case ThemeStyle.withAndWithoutLabel:
        return const BuildWithAndWithoutLabelSection();
      case ThemeStyle.blurEffect:
        return const BuildBlurEffectSection();
      default:
        return const BuildOriginDesignSection();
    }
  }
}
