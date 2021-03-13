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

import 'package:flutter/material.dart';
import 'package:cnav/cnav.dart';

void main() => runApp(MyApp());

enum ThemeStyle {
  Dribbble,
  Light,
  NoElevation,
  Icons,
  BorderRadius,
  FloatingBar,
  NotificationBadge,
  WithTitle,
  BlurEffect
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  ThemeStyle? _currentStyle = ThemeStyle.NotificationBadge;

  List<int> _badgeCounts = List<int>.generate(5, (index) => index);

  List<bool> _badgeShows = List<bool>.generate(5, (index) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody for floating bar get better perfomance
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Notification badge'),
              leading: Radio(
                value: ThemeStyle.NotificationBadge,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Dribbble'),
              leading: Radio(
                value: ThemeStyle.Dribbble,
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
                value: ThemeStyle.Light,
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
                value: ThemeStyle.NoElevation,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Custom Icon from Ant Design'),
              leading: Radio(
                value: ThemeStyle.Icons,
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
                value: ThemeStyle.BorderRadius,
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
                value: ThemeStyle.FloatingBar,
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
                value: ThemeStyle.WithTitle,
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
                value: ThemeStyle.BlurEffect,
                groupValue: _currentStyle,
                onChanged: (ThemeStyle? value) {
                  setState(() {
                    _currentStyle = value;
                  });
                },
              ),
            ),
            _buildBottomNavigationBar(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    switch (_currentStyle) {
      case ThemeStyle.Dribbble:
        return _buildOriginDesign();
      case ThemeStyle.Light:
        return _buildLightDesign();
      case ThemeStyle.Icons:
        return _buildCustomIconDesign();
      case ThemeStyle.BorderRadius:
        return _buildBorderRadiusDesign();
      case ThemeStyle.FloatingBar:
        return _buildFloatingBar();
      case ThemeStyle.NoElevation:
        return _buildNoElevation();
      case ThemeStyle.NotificationBadge:
        return _buildNotificationBadge();
      case ThemeStyle.WithTitle:
        return _buildTitle();
      case ThemeStyle.BlurEffect:
        return _buildBlurEffect();
      default:
        return _buildOriginDesign();
    }
  }

  Widget _buildTitle() {
    return CNav(
      iconSize: 30.0,
      selectedColor: Color(0xff040307),
      strokeColor: Color(0x30040307),
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
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

  Widget _buildNotificationBadge() {
    print("notification");
    return CNav(
      iconSize: 30.0,
      selectedColor: Color(0xff040307),
      strokeColor: Color(0x30040307),
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
        CNavItem(
          icon: Icon(Icons.home),
          badgeCount: _badgeCounts[0],
          showBadge: _badgeShows[0],
        ),
        CNavItem(
          icon: Icon(Icons.shopping_bag),
          badgeCount: _badgeCounts[1],
          showBadge: _badgeShows[1],
        ),
        CNavItem(
          icon: Icon(Icons.lightbulb_outline),
          badgeCount: _badgeCounts[2],
          showBadge: _badgeShows[2],
        ),
        CNavItem(
          icon: Icon(Icons.search),
          badgeCount: _badgeCounts[3],
          showBadge: _badgeShows[3],
        ),
        CNavItem(
          icon: Icon(Icons.account_circle),
          badgeCount: _badgeCounts[4],
          showBadge: _badgeShows[4],
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          _badgeShows[index] = false;
        });
      },
    );
  }

  Widget _buildOriginDesign() {
    return CNav(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Color(0xff6c788a),
      backgroundColor: Color(0xff040307),
      items: [
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

  Widget _buildLightDesign() {
    return CNav(
      iconSize: 30.0,
      selectedColor: Color(0xff040307),
      strokeColor: Color(0x30040307),
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
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

  Widget _buildNoElevation() {
    return CNav(
      elevation: 0.0,
      iconSize: 30.0,
      selectedColor: Color(0xff625aff),
      strokeColor: Color(0xff625aff),
      unSelectedColor: Colors.white,
      backgroundColor: Color(0xffa9a5f2),
      items: [
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

  Widget _buildCustomIconDesign() {
    return CNav(
      iconSize: 30.0,
      selectedColor: Color(0xff0c18fb),
      strokeColor: Color(0x300c18fb),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      items: [
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

  Widget _buildBorderRadiusDesign() {
    return CNav(
      iconSize: 30.0,
      selectedColor: Color(0xff0c18fb),
      strokeColor: Color(0x300c18fb),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      borderRadius: Radius.circular(20.0),
      items: [
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

  Widget _buildFloatingBar() {
    return CNav(
      iconSize: 30.0,
      selectedColor: Color(0xff0c18fb),
      strokeColor: Color(0x300c18fb),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      borderRadius: Radius.circular(20.0),
      items: [
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

  Widget _buildBlurEffect() {
    return CNav(
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.black,
      borderRadius: Radius.circular(20.0),
      blurEffect: true,
      opacity: 0.8,
      items: [
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
