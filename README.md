# CNav

A `custom navigation bar` a.k.a `CNav` with bubble click effect.<br>

[![pub package](https://img.shields.io/pub/v/cnav?style=for-the-badge)](https://pub.dev/packages/cnav) [![License: MIT](https://img.shields.io/badge/license-MIT-orange.svg?style=for-the-badge)](https://opensource.org/licenses/MIT) <a href="https://github.com/prodevplus/cnav/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/prodevplus/cnav?style=for-the-badge"></a> <img alt="GitHub forks" src="https://img.shields.io/github/forks/prodevplus/cnav?style=for-the-badge"></a><a href="https://github.com/prodevplus/cnav/issues">  <img alt="GitHub issues" src="https://img.shields.io/github/issues/prodevplus/cnav?style=for-the-badge"></a> <a href="https://github.com/prodevplus/cnav/network">




## Overview

This project is inspired by this [post from Dribbble](https://dribbble.com/shots/7134849-Simple-Tab-Bar-Animation) and [The Boring Flutter Development Show, Ep. 35](https://www.youtube.com/watch?v=Qk_x9y_wGXQ)

This package gives you a cute bubble effect when you click on the navigation bar.

Dribbble:<br>
<img src="https://cdn.dribbble.com/users/2114584/screenshots/7134849/media/96e4a6002a476bad7bd809ac71e28698.gif" width="400">

Implemented:<br>
<img src="./screenshot/6.gif" width="300">

## Gallery

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/1.gif" width="200"/>
                </a>
            </td>            
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/2.gif" width="200"/>
                </a>
            </td>  
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/3.gif" width="200"/>
                </a>
            </td>  
        </tr>
        <tr>
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/4.gif" width="200"/>
                </a>
            </td>  
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/5.gif" width="200"/>
                </a>
            </td>  
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/6.gif" width="200"/>
                </a>
            </td>  
        </tr>
        <tr>
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/7.gif" width="200"/>
                </a>
            </td>  
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/8.gif" width="200"/>
                </a>
            </td>
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/9.gif" width="200"/>
                </a>
            </td>
        </tr>
        <tr>
        <td style="text-align: center">
                <a>
                    <img src="./screenshot/10.gif" width="200"/>
                </a>
            </td>  
            <td style="text-align: center">
                <a>
                    <img src="./screenshot/11.gif" width="200"/>
                </a>
            </td>
        </tr>
    </table>
</div>

## How to install
Add this to your package's pubspec.yaml file:
```yaml
dependencies:
  cnav: <latest version>
```
## Documentation

```dart
CNavItem(
  {
    required this.icon,
    Widget selectedIcon,
    this.title,
    Text selectedTitle,
    this.badgeCount = 0,
    this.showBadge = false,
  })
    : selectedIcon = selectedIcon ?? icon,
      selectedTitle = selectedTitle ?? title;

  ///
  /// The icon of the item
  /// Typically the icon is an [Icon].
  ///

  final Widget icon;      
```


### You can customize these attributes in the navigation bar.<br>

| Attributes | Type | Description | Default |
| -------------------- | -------------- | ---------------- | --------------- |
| `scaleFactor` | `double`   | scale factor for the icon scale animation. | 0.2 |
| `elevation`   | `double` | The z-coordinate of this CNav | 8.0 |
| `items`   | `List` | item data in CNav  | required |
| `selectedColor`   | `Color` | [Color] when [CNavItem] is selected  | [blueAccent] |
| `unSelectedColor`   | `Color` | [Color] when [CNavItem] is not selected.  | grey[600] |
| `onTap`  | `Function(int)` | callback function when item tapped | null |
| `currentIndex`  | `int` | current index of navigation bar. | 0 |
| `iconSize`  | `double` | size of icon. also represent the max radius of bubble effect animation. | 24.0 |
| `backgroundColor`  | `Color` | Background color of [CNav] | Colors.white |
| `strokeColor`  | `Color` | stroke color | blueAccent |
| `bubbleCurve`  | `Curve` | animation curve of bubble effect | linear |
| `scaleCurve`  | `Curve` | animation curve of scale effect | linear |
| `borderRadius`  | `Radius` | border radius of navigation bar | Radius.zero |
| `isFloating`  | `bool` | control if CNav is floating | false |
| `blurEffect`  | `bool` | control if CNav show blur effect | false |
| `opacity`  | `double` | control CNav blur effect opacity when `blurEffect` is true | 0.8 |
| `margin`  | `EdgeInsetsGeometry` | Adds margin | EdgeInsets.zero |
| `padding`  | `EdgeInsetsGeometry` | Adds padding | EdgeInsets.zero |


**Attention**: If you set ```isFloating``` to  ```true```, I would recommend you to set ```extendBody``` to ```true``` in ```Scaffold``` for a better performance.

And for customize icon in the navigation bar, just put the icons you want in the ```CNavItem``` like this.
```dart
CNav(
        ...
        items: [
          CNavItem(
          icon: Icon(Icons.home),
          title: Text("hello"),
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
        ...
      )
```

If you want add notification badge, just use like this
```dart
CNav(
        ...
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
        ...
      )
```

To clear a badge, set `showBadge` to `false`

If you want add title under icon, just use like this
```dart
CNav(
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
```

If you want use Svg, just use like this
```dart
CNav(
      iconSize: 30.0,
      margin: const EdgeInsets.all(20),
      borderRadius: const Radius.circular(10),
      strokeColor: const Color(0x300c18fb),
      backgroundColor: Colors.white,
      items: [
        CNavItem(
          title: const Text('Home'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/home.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/home.svg",
            color: Colors.pinkAccent,
          ),
        ),
        CNavItem(
          title: const Text('Shopping'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/shopping-bag.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/shopping-bag.svg",
            color: Colors.pinkAccent,
          ),
        ),
        CNavItem(
          title: const Text('Cloud'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/cloud.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/cloud.svg",
            color: Colors.pinkAccent,
          ),
        ),
        CNavItem(
          title: const Text('Search'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/magnifying-glass.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/magnifying-glass.svg",
            color: Colors.pinkAccent,
          ),
        ),
        CNavItem(
          title: const Text('Profile'),
          icon: SvgPicture.asset(
            "assets/icons/svg/outline/user.svg",
            color: Colors.amber,
          ),
          selectedIcon: SvgPicture.asset(
            "assets/icons/svg/solid/user.svg",
            color: Colors.pinkAccent,
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
```


## Example
Check `example app` for more details.

## Contribute
Issues and pull requests are welcomed!!

### Future Plans
- [x] Code format.
- [x] Make it more like native navigation bar in Flutter.
- [x] Better documentation.
- [ ] Optimizing Margin and Padding Implementation!
- [ ] More customizations!!
And more...