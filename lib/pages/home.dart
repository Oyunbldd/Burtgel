import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import './account.dart';
import './calendar.dart';
import './history.dart';
import './notification.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<dynamic> _pages = [
    Calendar(),
    NotificationPage(),
    History(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: HexColor('#39A2DB'),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 10.0,
          unselectedFontSize: 0.0,
          iconSize: 25.0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Нүүр'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              title: Text('Мэдэгдэл'),
              activeIcon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text('Түүх'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              title: Text('Профайл'),
              activeIcon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}
