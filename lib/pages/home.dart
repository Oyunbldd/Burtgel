import 'package:flutter/material.dart';
import './account.dart';
import 'calendar.dart';
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
    History(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/callpro_logo.png',
            ),
          ),
          leadingWidth: 300,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Color(0xFF0C0C54),
              ),
            )
          ],
        ),
        body: Center(
          child: _pages.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blueAccent,
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
              title: Text(
                'Нүүр',
                style: TextStyle(fontSize: 12),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text(
                'Түүх',
                style: TextStyle(fontSize: 12),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              title: Text(
                'Профайл',
                style: TextStyle(fontSize: 12),
              ),
              activeIcon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
  }
}
