import 'package:date_format/date_format.dart';
import 'package:e_sankalp/src/const/app_colors.dart';
import 'package:e_sankalp/src/const/app_font.dart';
import 'package:e_sankalp/src/controllers/temple_controller.dart';
import 'package:e_sankalp/src/models/temple_list_model.dart';
import 'package:e_sankalp/src/view/account_views/my_family_screen.dart';
import 'package:e_sankalp/src/view/temples_view/special_features.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PujaBookingView extends StatefulWidget {
  String image;
  String title;
  String place;
  TempleData templeData;
  PujaBookingView(
      {super.key,
      required this.image,
      required this.title,
      required this.templeData,
      required this.place});

  @override
  State<PujaBookingView> createState() => _PujaBookingViewState();
}

class _PujaBookingViewState extends State<PujaBookingView> {
  final templesController = Get.find<TempleController>();

  String _dateController = "dd/mm/yyyy";

  DateTime date = DateTime.now();

  TimeOfDay time = TimeOfDay.now();

  var timeSelcted;

  String timeString = "HH:SS:MM";

  TimeOfDay timeSelected = TimeOfDay.now();

  List<String> timeList = ["Morning", "Noon", "After Noon", "Evening", "Night"];

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: secondaryColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null)
      setState(() {
        date = picked;
        _dateController = DateFormat.yMMMEd().format(date);
      });
  }

  _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: secondaryColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: primaryColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null)
      setState(() {
        time = picked;

        timeString = formatDate(DateTime(2019, 08, 1, time.hour, time.minute),
            [hh, ':', nn, " ", am]).toString();
        templesController.timeString(timeString);
      });

    templesController.update();
  }

  @override
  void initState() {
    super.initState();
    templesController.getFamilyMembers();
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
          "Puja Booking",
          style: primaryFont.copyWith(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: secondaryColor,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${widget.title}\n${widget.place}\nIndia,600021",
                    style: primaryFont.copyWith(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
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
                              hintText: "Search puja"),
                        ),
                      ),
                      Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 14,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            //
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Select Deity",
                style: primaryFont.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                onTap: () {
                  Get.to(() => SpecialFeaturesView(
                        title: widget.title,
                      ));
                },
                child: Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  alignment: Alignment.center,
                  child: Text(
                    "Special Features",
                    style:
                        primaryFont.copyWith(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                onTap: () {
                  _showAddMemberDialoage(context);
                },
                child: Container(
                  height: 40,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  alignment: Alignment.center,
                  child: Text(
                    "Select Members",
                    style:
                        primaryFont.copyWith(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Dakshina Details",
                style: primaryFont.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.black.withOpacity(0.6)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Priest Amount :",
                            style: primaryFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "₹${templesController.priestAmount.value}",
                            style: primaryFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Offering Amount:",
                            style: primaryFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "₹${templesController.offeringAmount.value}",
                            style: primaryFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount:",
                            style: primaryFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "₹${templesController.totalAmount.value}",
                            style: primaryFont.copyWith(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Select Puja",
                style: primaryFont.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            if (widget.templeData.poojas.poojaName1 != "null")
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    templesController.pujaIndex(0);
                    templesController.priestAmount(0);
                    templesController.offeringAmount(
                        int.parse(widget.templeData.poojas.poojaCost1));
                    templesController.totalAmount(
                        int.parse(widget.templeData.poojas.poojaCost1));
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey.withOpacity(0.6),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.templeData.poojas.poojaName1,
                            style: primaryFont.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹${widget.templeData.poojas.poojaCost1}",
                                style: primaryFont.copyWith(
                                  color: primaryColor,
                                ),
                              ),
                              if (templesController.pujaIndex.value == 0)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.templeData.poojas.poojaName1 != "null")
              const SizedBox(
                height: 10,
              ),
            if (widget.templeData.poojas.poojaName2 != "null" &&
                widget.templeData.poojas.poojaCost2 != "null")
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    templesController.pujaIndex(1);
                    templesController.priestAmount(0);
                    templesController.offeringAmount(
                        int.parse(widget.templeData.poojas.poojaCost2));
                    templesController.totalAmount(
                        int.parse(widget.templeData.poojas.poojaCost2));
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey.withOpacity(0.6),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.templeData.poojas.poojaName2,
                            style: primaryFont.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹${widget.templeData.poojas.poojaCost2}",
                                style: primaryFont.copyWith(
                                  color: primaryColor,
                                ),
                              ),
                              if (templesController.pujaIndex.value == 1)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.templeData.poojas.poojaName2 != "null" &&
                widget.templeData.poojas.poojaCost2 != "null")
              const SizedBox(
                height: 10,
              ),
            if (widget.templeData.poojas.poojaName3 != "null" &&
                widget.templeData.poojas.poojaCost3 != "null")
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    templesController.pujaIndex(2);
                    templesController.priestAmount(0);
                    templesController.offeringAmount(
                        int.parse(widget.templeData.poojas.poojaCost3));
                    templesController.totalAmount(
                        int.parse(widget.templeData.poojas.poojaCost3));
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey.withOpacity(0.6),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.templeData.poojas.poojaName3,
                            style: primaryFont.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹${widget.templeData.poojas.poojaCost3}",
                                style: primaryFont.copyWith(
                                  color: primaryColor,
                                ),
                              ),
                              if (templesController.pujaIndex.value == 2)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.templeData.poojas.poojaName3 != "null" &&
                widget.templeData.poojas.poojaCost3 != "null")
              const SizedBox(
                height: 10,
              ),
            if (widget.templeData.poojas.poojaName4 != "null" &&
                widget.templeData.poojas.poojaCost4 != "null")
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    templesController.pujaIndex(3);
                    templesController.priestAmount(0);
                    templesController.offeringAmount(
                        int.parse(widget.templeData.poojas.poojaCost4));
                    templesController.totalAmount(
                        int.parse(widget.templeData.poojas.poojaCost4));
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey.withOpacity(0.6),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.templeData.poojas.poojaName4,
                            style: primaryFont.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹${widget.templeData.poojas.poojaCost4}",
                                style: primaryFont.copyWith(
                                  color: primaryColor,
                                ),
                              ),
                              if (templesController.pujaIndex.value == 3)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.templeData.poojas.poojaName4 != "null" &&
                widget.templeData.poojas.poojaCost4 != "null")
              const SizedBox(
                height: 10,
              ),
            if (widget.templeData.poojas.poojaName5 != "null" &&
                widget.templeData.poojas.poojaCost5 != "null")
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    templesController.pujaIndex(4);
                    templesController.priestAmount(0);
                    templesController.offeringAmount(
                        int.parse(widget.templeData.poojas.poojaCost5));
                    templesController.totalAmount(
                        int.parse(widget.templeData.poojas.poojaCost5));
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey.withOpacity(0.6),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.templeData.poojas.poojaName5,
                            style: primaryFont.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹${widget.templeData.poojas.poojaCost5}",
                                style: primaryFont.copyWith(
                                  color: primaryColor,
                                ),
                              ),
                              if (templesController.pujaIndex.value == 4)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (widget.templeData.poojas.poojaName5 != "null")
              const SizedBox(
                height: 10,
              ),

            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Select Date",
                style: primaryFont.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Colors.grey.withOpacity(0.6),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _dateController,
                          style: primaryFont.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: primaryColor,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey[300]),
                  alignment: Alignment.center,
                  child: Text(
                    "Cancel",
                    style:
                        primaryFont.copyWith(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                onTap: () {
                  List<dynamic> membersList = [];
                  if (_dateController != "dd/mm/yyyy" &&
                      timeString != "HH:SS:MM") {
                    for (var eve in templesController.membersList) {
                      if (eve.isSelected) {
                        membersList.add(
                          {"member_id": eve.id.toString()},
                        );
                      }
                    }

                    templesController.bookPooja(
                        templeId: widget.templeData.id.toString(),
                        memeberList: membersList,
                        offerAmount:
                            templesController.offeringAmount.toString(),
                        poojaDate: date,
                        preiestAmount: "0",
                        session: templesController.timeSelected.value,
                        time: timeString,
                        totalAmount:
                            templesController.offeringAmount.toString());
                  } else {
                    Get.snackbar(
                      "Fill all fields",
                      "",
                      icon: const Icon(Icons.check_circle_outline_outlined,
                          color: Colors.white),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      borderRadius: 20,
                      margin: const EdgeInsets.all(15),
                      colorText: Colors.white,
                      duration: const Duration(seconds: 3),
                      isDismissible: true,
                      dismissDirection: DismissDirection.horizontal,
                      forwardAnimationCurve: Curves.easeOutBack,
                    );
                  }
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: primaryColor),
                  alignment: Alignment.center,
                  child: Text(
                    "Pay",
                    style:
                        primaryFont.copyWith(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> _showAddMemberDialoage(BuildContext context) async {
    templesController.getFamilyMembers();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: GetBuilder<TempleController>(
              builder: (_) => ListBody(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Members",
                        style: primaryFont.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          CupertinoIcons.xmark_circle,
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  for (int i = 0; i < templesController.membersList.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          templesController.membersList[i].isSelected =
                              !templesController.membersList[i].isSelected;
                          templesController.update();
                        },
                        child: Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    color: Colors.grey.withOpacity(0.7))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      templesController.membersList[i].name,
                                      style: primaryFont.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      templesController
                                          .membersList[i].nakshtraType,
                                      style: primaryFont.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                                if (templesController.membersList[i].isSelected)
                                  Icon(
                                    Icons.check,
                                    color: primaryColor,
                                    size: 16,
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Select time schedule",
                    style: primaryFont.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              templesController.timeString.value,
                              style: primaryFont.copyWith(fontSize: 13),
                            ),
                            const Icon(
                              Icons.access_time_outlined,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.black54.withOpacity(0.8))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 7),
                      child: DropdownButton<String>(
                        value: templesController.timeSelected.value,
                        isExpanded: true,
                        isDense: true,
                        hint: Text(
                          "Morning",
                          style: primaryFont.copyWith(fontSize: 14),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 0,
                        style: const TextStyle(color: Colors.black54),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.

                          setState(() {
                            timeSelcted = value!;
                          });

                          templesController.timeSelected(value);
                          templesController.update();
                        },
                        items: timeList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => MyFamilyScreen());
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.grey[300]),
                            alignment: Alignment.center,
                            child: Text(
                              "Add member",
                              style: primaryFont.copyWith(
                                  color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 2),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: primaryColor),
                            alignment: Alignment.center,
                            child: Text(
                              "Select",
                              style: primaryFont.copyWith(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
