import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/models/temple_detail_model.dart';
import 'package:e_sankalp/src/models/temple_list_model.dart';
import 'package:e_sankalp/src/view/home_view/notification_screen.dart';
import 'package:e_sankalp/src/view/temples_view/pooja_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TempleDetailsView extends StatefulWidget {
  String image;
  String title;
  String place;
  TempleData templeData;
  List<TempleDetail> templeDetails;
  TempleDetailsView(
      {super.key,
      required this.image,
      required this.templeData,
      required this.title,
      required this.templeDetails,
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
                Get.to(() => const NotificationScreen());
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
                      image: NetworkImage(widget.image), fit: BoxFit.cover)),
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
            child: widget.templeDetails.isEmpty
                ? Text(
                    "",
                    style: primaryFont.copyWith(fontSize: 12),
                  )
                : Text(
                    widget.templeDetails.first.history,
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
            child: widget.templeDetails.isEmpty
                ? Text(
                    "",
                    style: primaryFont.copyWith(fontSize: 12),
                  )
                : Text(
                    widget.templeDetails.first.architecture,
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
            child: widget.templeDetails.isEmpty
                ? Text(
                    "",
                    style: primaryFont.copyWith(fontSize: 12),
                  )
                : Text(
                    widget.templeDetails.first.significance,
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
            child: widget.templeDetails.isEmpty
                ? Text(
                    "",
                    style: primaryFont.copyWith(fontSize: 12),
                  )
                : Text(
                    widget.templeDetails.first.miscellanous,
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
                        widget.templeData.address,
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
                        widget.templeData.phone,
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
                           templeData: widget.templeData,
                          place: widget.place,
                          title: widget.title,
                        ));
                  },
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color.fromARGB(255, 33, 124, 36)),
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
