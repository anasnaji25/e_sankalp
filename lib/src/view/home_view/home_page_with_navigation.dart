import 'package:bottom_bar/bottom_bar.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:flutter/material.dart';

class HomePageWithNavigation extends StatefulWidget {
  const HomePageWithNavigation({super.key});

  @override
  State<HomePageWithNavigation> createState() => _HomePageWithNavigationState();
}

class _HomePageWithNavigationState extends State<HomePageWithNavigation> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          setState(() => _currentPage = index);
        },
        backgroundColor: primaryColor,
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
