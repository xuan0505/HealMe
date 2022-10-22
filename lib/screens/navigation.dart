import 'package:flutter/material.dart';
import 'package:testheal/screens/home.dart';
import 'package:testheal/screens/galaxy.dart';
import 'package:testheal/screens/meditimer.dart';
import 'package:testheal/screens/mood.dart';
import 'package:testheal/utils/color.dart';
import 'package:testheal/utils/reusableWidgets.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  bool showNavBar = true;

  // List of Pages
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Galaxy(),
    MediTimer(),
    Mood()
  ];

  @override
  Widget build(BuildContext context) {
    var color = HexColor.fromHex("B057D2");
    return Scaffold(
        extendBody: true,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Visibility(
            visible: showNavBar,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: SizedBox(
                    height: 90,
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      currentIndex: _selectedIndex,
                      selectedItemColor: color,
                      unselectedItemColor: HexColor.fromHex("848384"),
                      unselectedLabelStyle: textStyle(
                          'JosefinSans', FontWeight.bold, 15.0, Colors.white),
                      selectedLabelStyle: textStyle(
                          'JosefinSans', FontWeight.bold, 15.0, Colors.white),
                      onTap: (currentIndex) {
                        setState(() => _selectedIndex = currentIndex);
                        if (currentIndex == 1) {
                          setState(() => showNavBar = false);
                        } else {
                          setState(() => showNavBar = true);
                        }
                      },
                      backgroundColor: HexColor.fromHex("313131"),
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.home,
                              size: 30,
                            ),
                          ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.rocket,
                              size: 30,
                            ),
                          ),
                          label: 'Galaxy',
                        ),
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.hourglass_full_sharp,
                              size: 30,
                            ),
                          ),
                          label: 'MediTimer',
                        ),
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.emoji_emotions,
                              size: 30,
                            ),
                          ),
                          label: 'Mood',
                        ),
                      ],
                    )))));
  }
}
