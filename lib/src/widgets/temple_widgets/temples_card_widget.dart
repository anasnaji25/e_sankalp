import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/temple_controller.dart';
import 'package:e_sankalp/src/models/temple_detail_model.dart';
import 'package:e_sankalp/src/models/temple_list_model.dart';
import 'package:e_sankalp/src/view/temples_view/temple_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TempleCard extends StatelessWidget {
  int id;
  TempleData templeData;
  String image;
  String titile;
  String place;
  double height;
  double width;
  TextStyle titleStyle;
  TextStyle placeStyle;
  double titleHeight;
  double radius;
  TempleCard(
      {super.key,
      required this.templeData,
      required this.image,
      required this.id,
      required this.place,
      required this.height,
      required this.width,
      required this.placeStyle,
      required this.titleStyle,
      this.radius = 10,
      this.titleHeight = 55,
      required this.titile});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () async {
          List<TempleDetail> _templeDetails = await Get.find<TempleController>()
              .getTempleDetailsById(id: id.toString());

          Get.to(() => TempleDetailsView(
            templeData: templeData,
            templeDetails: _templeDetails,
                image: image,
                title: titile,
                place: place,
              ));
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 2, color: Colors.grey.withOpacity(0.7))
              ]),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover)),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Container(
                      height: titleHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(titile, style: titleStyle),
                          Text(place, style: placeStyle)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
