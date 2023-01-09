import 'package:bottom_bar/bottom_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/temple_controller.dart';
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
  final templeController = Get.find<TempleController>();

  @override
  void initState() {
    super.initState();
    templeController.getAdminBookingList();
  }

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
            "Sankalp",
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
        body: GetBuilder<TempleController>(
          builder: (_) {
            return ListView.builder(
              itemCount: templeController.adminBookingList.length,
              itemBuilder: (context, index) {
                return Padding(
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
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.network(templeController.adminBookingList[index].temples.image1,fit: BoxFit.cover,)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              templeController.adminBookingList[index].temples.templeName,
                              style: primaryFont.copyWith(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              templeController.adminBookingList[index].session,
                              style: primaryFont.copyWith(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "₹${templeController.adminBookingList[index].totalAmount}",
                              style: primaryFont.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              formatDate(templeController.adminBookingList[index].poojaDate, [M," ",dd,",",yyyy]),
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
                );
              },
            );
          }
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
        ));
  }
}
