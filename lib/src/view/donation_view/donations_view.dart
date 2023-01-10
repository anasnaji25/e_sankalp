import 'package:bottom_bar/bottom_bar.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/donation_amount_controller.dart';
import 'package:e_sankalp/src/view/donation_view/donate_now_details_screen.dart';
import 'package:e_sankalp/src/view/home_view/home_page_with_navigation.dart';
import 'package:e_sankalp/src/view/home_view/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationsView extends StatefulWidget {
  const DonationsView({super.key});

  @override
  State<DonationsView> createState() => _DonationsViewState();
}

class _DonationsViewState extends State<DonationsView> {
  int _currentPage = 0;

  final donationsController = Get.find<DonationController>();

  @override
  void initState() {
    super.initState();
    donationsController.getDonationsList();
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
                "Donate",
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
      body: GetBuilder<DonationController>(builder: (_) {
        return ListView.builder(
          itemCount: donationsController.donationsList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                 Get.to(() => DonateNowDetailsScreen(
                      donateData: donationsController.donationsList[index],
                    ));
              },
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 120,
                          child: Image.network(
                            donationsController.donationsList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 60,
                              width: size.width / 2,
                              child: Text(
                                  donationsController
                                      .donationsList[index].donateTitle,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                  style: primaryFont.copyWith(fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Raised of Goal",
                                          style: primaryFont.copyWith(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          "₹${donationsController.donationsList[index].raisedOfGoal}",
                                          style: primaryFont.copyWith(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Archived",
                                          style: primaryFont.copyWith(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          "₹${donationsController.donationsList[index].archievedGoal}",
                                          style: primaryFont.copyWith(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => DonateNowDetailsScreen(
                                          donateData: donationsController
                                              .donationsList[index],
                                        ));
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.cyan,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 5, top: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 2),
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Donate",
                                                style: primaryFont.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                "Now",
                                                style: primaryFont.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                ],
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
