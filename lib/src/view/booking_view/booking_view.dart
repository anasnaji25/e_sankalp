import 'package:bottom_bar/bottom_bar.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/temple_controller.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:e_sankalp/src/view/home_view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  int _currentPage = 0;

  final templeController = Get.find<TempleController>();

  @override
  void initState() {
    super.initState();
    templeController.getMyBookingsList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              leading: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              title: Text(
                "Booking",
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 40,
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                              hintText: "Temple Name or City"),
                        ),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<TempleController>(builder: (_) {
        return ListView.builder(
          itemCount: templeController.bookingList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,bottom: 15),
              child: Container(
                height: 180,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: secondaryColor,
                    )),
                child: Stack(children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        templeController.bookingList[index].temples.image1 ??
                            "https://static.india.com/wp-content/uploads/2018/08/Amritsar-Main-1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 30,
                      width: size.width - 40,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              templeController
                                  .bookingList[index].temples.templeName,
                              style: primaryFont.copyWith(
                                  color: Colors.white, fontSize: 15),
                            ),
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green),
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "Booked",
                                  style: primaryFont.copyWith(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            );
          },
        );
      }),
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
