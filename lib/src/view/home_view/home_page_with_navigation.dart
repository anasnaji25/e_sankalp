import 'package:bottom_bar/bottom_bar.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/view/account_views/my_account_screen.dart';
import 'package:e_sankalp/src/view/home_view/frequently_question_screen.dart';
import 'package:e_sankalp/src/view/home_view/home_page_view.dart';
import 'package:e_sankalp/src/view/home_view/my_booking_screen.dart';
import 'package:e_sankalp/src/view/home_view/support_help_screen.dart';
import 'package:flutter/material.dart';

class HomePageWithNavigation extends StatefulWidget {
  int index;
  HomePageWithNavigation({super.key, this.index = 0});

  @override
  State<HomePageWithNavigation> createState() => _HomePageWithNavigationState();
}

class _HomePageWithNavigationState extends State<HomePageWithNavigation> {
  int _currentPage = 0;
  
  @override
  void initState() {
    super.initState();
    setState(() {
      _currentPage = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage == 0
          ? HomePageView()
          : _currentPage == 1
              ? FrequentlyQuestionScreen()
              : _currentPage == 2
                  ? MyBookingScreen()
                  : _currentPage == 3
                      ? SupportAndHelp()
                      : _currentPage == 4
                          ? MyAccountScreen()
                          : HomePageView(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [secondaryColor, primaryColor])),
        child: BottomBar(
          selectedIndex: _currentPage,
          onTap: (int index) {
            setState(() => _currentPage = index);
          },
          backgroundColor: Colors.transparent,
          items: <BottomBarItem>[
            BottomBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColorOpacity: 1,
                activeColor: Colors.white,
                activeTitleColor: primaryColor,
                activeIconColor: primaryColor,
                inactiveColor: Colors.white.withOpacity(0.8)),
            BottomBarItem(
                icon: Image.asset(
                  "assets/icons/372890_faq_full_question_round_icon.png",
                  color: _currentPage == 1 ? primaryColor : Colors.white,
                ),
                title: Text('FAQ'),
                backgroundColorOpacity: 1,
                activeColor: Colors.white,
                activeTitleColor: primaryColor,
                activeIconColor: primaryColor,
                inactiveColor: Colors.white),
            BottomBarItem(
                icon: Image.asset(
                  "assets/icons/9070823_ticket_icon.png",
                  color: _currentPage == 2 ? primaryColor : Colors.white,
                ),
                title: Text('My Booking'),
                backgroundColorOpacity: 1,
                activeColor: Colors.white,
                activeTitleColor: primaryColor,
                activeIconColor: primaryColor,
                inactiveColor: Colors.white),
            BottomBarItem(
                icon: Image.asset(
                  "assets/icons/9069173_customer_icon.png",
                  color: _currentPage == 3 ? primaryColor : Colors.white,
                ),
                title: Text('Support'),
                backgroundColorOpacity: 1,
                activeColor: Colors.white,
                activeTitleColor: primaryColor,
                activeIconColor: primaryColor,
                inactiveColor: Colors.white),
            BottomBarItem(
                icon: Icon(Icons.person_outline),
                title: Text('Account'),
                backgroundColorOpacity: 1,
                activeColor: Colors.white.withOpacity(0.5),
                activeTitleColor: primaryColor,
                activeIconColor: primaryColor,
                inactiveColor: Colors.white.withOpacity(0.7)),
          ],
        ),
      ),
    );
  }
}
