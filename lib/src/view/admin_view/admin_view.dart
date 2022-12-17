import 'package:bottom_bar/bottom_bar.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:e_sankalp/src/view/home_view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          "Admin",
          style: primaryFont.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: Icon(
                Icons.notifications,
                color: secondaryColor,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Customer Booking's",
              style: primaryFont.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 130,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2, color: Colors.grey.withOpacity(0.4))
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/images/admin_bookin (4).png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hindu Temple in Tamil Nadu",
                        style: primaryFont.copyWith(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Raja Ram",
                        style: primaryFont.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹ 61.00",
                        style: primaryFont.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Jan 03,2023",
                        style: primaryFont.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
           const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 130,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2, color: Colors.grey.withOpacity(0.4))
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("assets/images/admin_bookin (3).png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vinayanagar Temple",
                        style: primaryFont.copyWith(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Raja Ram",
                        style: primaryFont.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹ 99.00",
                        style: primaryFont.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Jan 01,2023",
                        style: primaryFont.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [secondaryColor, primaryColor])),
          child: BottomBar(
            selectedIndex: 0,
            onTap: (int index) {
              Get.off(() => HomePageWithNavigation(
                    index: index,
                  ));
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
                  title: Text('Booking'),
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
        )
    );
  }
}
