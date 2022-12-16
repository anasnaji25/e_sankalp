import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/view/home_view/notification_screen.dart';
import 'package:e_sankalp/src/view/temples_view/pooja_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TempleDetailsView extends StatefulWidget {
  String image;
  String title;
  String place;
  TempleDetailsView(
      {super.key,
      required this.image,
      required this.title,
      required this.place});

  @override
  State<TempleDetailsView> createState() => _TempleDetailsViewState();
}

class _TempleDetailsViewState extends State<TempleDetailsView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 170,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "Temple History:",
              style: GoogleFonts.lexend().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "The temple started initially as a thatched hut where Murugan's ardent devotee Annaswami Nayakar kept a portrait of the God and worshipped him. The temple was built on the same site as the thatched hut around 1890. He was the founder and the first priest of the temple. The devotees believed his sacred words gave effective solutions to problems, including education, failure in examinations, marriage issues, ailments, and unemployment, among others.",
              style: primaryFont.copyWith(fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "Architecture of ${widget.title}:",
              style: GoogleFonts.lexend().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "The temple is built on the traditional lines of south Indian temples. The Rajagopuram at the entrance has several stuccos with the legends of the Skanda Purana depicted on them. The Moolavar (main deity) resembles the Palani temple idol and is in standing position.",
              style: primaryFont.copyWith(fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "Significance of ${widget.title}:",
              style: GoogleFonts.lexend().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "The belief is very strong here that people who cannot undertake the pilgrimage to the Palani temple can visit the Vadapalani temple with their offerings. Palaniandavar showers devotees with his blessings just the same as in Southern Palani. His grace resolves all issues for devotees, and they believe in the power of this sacred temple.",
              style: primaryFont.copyWith(fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "Miscellaneous:",
              style: GoogleFonts.lexend().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "The temple is maintained and administered by the Hindu Religious and Charitable Endowments Department of the Government of Tamil Nadu.",
              style: primaryFont.copyWith(fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.location_on,
                        color: primaryColor,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Chennai",
                        style: primaryFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.call,
                        color: primaryColor,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "9857453276",
                        style: primaryFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 10),
                child: InkWell(
                  onTap: () {
                    Get.to(() => PujaBookingView(
                          image: "",
                          place: widget.place,
                          title: widget.title,
                        ));
                  },
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromARGB(255, 33, 124, 36)),
                    alignment: Alignment.center,
                    child: Text(
                      "Booking",
                      style: primaryFont.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
