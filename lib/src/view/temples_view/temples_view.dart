import 'package:bottom_bar/bottom_bar.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:e_sankalp/src/view/home_view/notification_screen.dart';
import 'package:e_sankalp/src/widgets/temple_widgets/temples_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemplesView extends StatefulWidget {
  const TemplesView({super.key});

  @override
  State<TemplesView> createState() => _TemplesViewState();
}

class _TemplesViewState extends State<TemplesView> {
  int _currentPage = 0;
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
                "Temples",
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
                    border: Border.all(color: Colors.black),
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
      body: ListView(
        children: [
          TempleCard(
            image: "assets/images/temple_image (3).png",
            titile: "Sri Kamachi Temple",
            place: "Madhurai, Tamilnadu, India",
            height: 200,
            width: size.width,
            titleStyle: primaryFont.copyWith(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 19),
            placeStyle: primaryFont.copyWith(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 126,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, top: 3),
                  child: TempleCard(
                    image: "assets/images/temple_image (8).png",
                    titile: "Sri Kumaran Temple",
                    place: "Chennai, Tamilnadu, India",
                    height: 120,
                    width: 150,
                    titleStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                    placeStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 8),
                    titleHeight: 35,
                    radius: 6,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, top: 3),
                  child: TempleCard(
                    image: "assets/images/temple_image (4).png",
                    titile: "Sri Kamachi Temple",
                    place: "Erode, Tamilnadu, India",
                    height: 120,
                    width: 150,
                    titleStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                    placeStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 8),
                    titleHeight: 35,
                    radius: 6,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, top: 3),
                  child: TempleCard(
                    image: "assets/images/temple_image (1).png",
                    titile: "Thanjavur Temple",
                    place: "Tamilnadu, India",
                    height: 120,
                    width: 150,
                    titleStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                    placeStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 8),
                    titleHeight: 35,
                    radius: 6,
                  ),
                ),
              ],
            ),
          ), //horizontal list view ending

          const SizedBox(
            height: 15,
          ),
          TempleCard(
            image: "assets/images/temple_image (5).png",
            titile: "Murugan Temple",
            place: "Chennai, Tamilnadu, India",
            height: 200,
            width: size.width,
            titleStyle: primaryFont.copyWith(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 19),
            placeStyle: primaryFont.copyWith(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 126,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, top: 3),
                  child: TempleCard(
                    image: "assets/images/temple_image (8).png",
                    titile: "Sri Kumaran Temple",
                    place: "Chennai, Tamilnadu, India",
                    height: 120,
                    width: 150,
                    titleStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                    placeStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 8),
                    titleHeight: 35,
                    radius: 6,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, top: 3),
                  child: TempleCard(
                    image: "assets/images/temple_image (4).png",
                    titile: "Sri Kamachi Temple",
                    place: "Erode, Tamilnadu, India",
                    height: 120,
                    width: 150,
                    titleStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                    placeStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 8),
                    titleHeight: 35,
                    radius: 6,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3, top: 3),
                  child: TempleCard(
                    image: "assets/images/temple_image (1).png",
                    titile: "Thanjavur Temple",
                    place: "Tamilnadu, India",
                    height: 120,
                    width: 150,
                    titleStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                    placeStyle: primaryFont.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 8),
                    titleHeight: 35,
                    radius: 6,
                  ),
                ),
              ],
            ),
          ), //horizontal list view ending
          const SizedBox(
            height: 60,
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
      ),
    );
  }
}
