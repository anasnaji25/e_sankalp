// To parse this JSON data, do
//
//     final myBookingsModel = myBookingsModelFromJson(jsonString);

import 'dart:convert';

MyBookingsModel myBookingsModelFromJson(String str) =>
    MyBookingsModel.fromJson(json.decode(str));

String myBookingsModelToJson(MyBookingsModel data) =>
    json.encode(data.toJson());

class MyBookingsModel {
  MyBookingsModel({
    required this.message,
    required this.bookingList,
  });

  String message;
  List<BookingList> bookingList;

  factory MyBookingsModel.fromJson(Map<String, dynamic> json) =>
      MyBookingsModel(
        message: json["message"],
        bookingList: List<BookingList>.from(
            json["Booking_list"].map((x) => BookingList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "Booking_list": List<dynamic>.from(bookingList.map((x) => x.toJson())),
      };
}

class BookingList {
  BookingList({
    required this.id,
    required this.userId,
    required this.templeId,
    required this.memberId,
    required this.time,
    required this.session,
    required this.priestAmount,
    required this.offerAmount,
    required this.totalAmount,
    required this.pujaId,
    required this.poojaDate,
    required this.createdAt,
    required this.updatedAt,
    required this.temples,
  });

  int id;
  String userId;
  String templeId;
  String memberId;
  String time;
  String session;
  String priestAmount;
  String offerAmount;
  String totalAmount;
  String pujaId;
  DateTime poojaDate;
  DateTime createdAt;
  DateTime updatedAt;
  Temples temples;

  factory BookingList.fromJson(Map<String, dynamic> json) => BookingList(
        id: json["id"],
        userId: json["user_id"],
        templeId: json["temple_id"],
        memberId: json["member_id"],
        time: json["time"],
        session: json["session"],
        priestAmount: json["priest_amount"],
        offerAmount: json["offer_amount"],
        totalAmount: json["total_amount"],
        pujaId: json["puja_id"],
        poojaDate: DateTime.parse(json["pooja_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        temples: Temples.fromJson(json["temples"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "temple_id": templeId,
        "member_id": memberId,
        "time": time,
        "session": session,
        "priest_amount": priestAmount,
        "offer_amount": offerAmount,
        "total_amount": totalAmount,
        "puja_id": pujaId,
        "pooja_date":
            "${poojaDate.year.toString().padLeft(4, '0')}-${poojaDate.month.toString().padLeft(2, '0')}-${poojaDate.day.toString().padLeft(2, '0')}",
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "temples": temples.toJson(),
      };
}

class Temples {
  Temples({
    required this.id,
    required this.templeName,
    required this.maleDeityName,
    this.maleGodName1,
    this.maleGodName2,
    this.maleGodName3,
    required this.femaleDeityName,
    this.femaleGodName1,
    this.femaleGodName2,
    this.femaleGodName3,
    required this.otherDeityName,
    required this.planetSpeciality,
    required this.templeCategory,
    required this.morningOpenTime,
    required this.morningCloseTime,
    required this.eveningOpenTime,
    required this.eveningCloseTime,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.videos,
    this.deityName,
    this.hrnc,
    this.organisation,
    this.address,
    this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String templeName;
  dynamic maleDeityName;
  dynamic maleGodName1;
  dynamic maleGodName2;
  dynamic maleGodName3;
  dynamic femaleDeityName;
  dynamic femaleGodName1;
  dynamic femaleGodName2;
  dynamic femaleGodName3;
  dynamic otherDeityName;
  String planetSpeciality;
  dynamic templeCategory;
  dynamic morningOpenTime;
  dynamic morningCloseTime;
  dynamic eveningOpenTime;
  dynamic eveningCloseTime;
  dynamic image1;
  dynamic image2;
  dynamic image3;
  dynamic image4;
  dynamic videos;
  dynamic deityName;
  dynamic hrnc;
  dynamic organisation;
  dynamic address;
  dynamic phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory Temples.fromJson(Map<String, dynamic> json) => Temples(
        id: json["id"],
        templeName: json["temple_name"],
        maleDeityName: json["male_deity_name"],
        maleGodName1: json["male_god_name1"],
        maleGodName2: json["male_god_name2"],
        maleGodName3: json["male_god_name3"],
        femaleDeityName: json["female_deity_name"],
        femaleGodName1: json["female_god_name1"],
        femaleGodName2: json["female_god_name2"],
        femaleGodName3: json["female_god_name3"],
        otherDeityName: json["other_deity_name"],
        planetSpeciality: json["planet_speciality"],
        templeCategory: json["temple_category"],
        morningOpenTime: json["morning_open_time"],
        morningCloseTime: json["morning_close_time"],
        eveningOpenTime: json["evening_open_time"],
        eveningCloseTime: json["evening_close_time"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        videos: json["videos"],
        deityName: json["deity_name"],
        hrnc: json["hrnc"],
        organisation: json["organisation"],
        address: json["address"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "temple_name": templeName,
        "male_deity_name": maleDeityName,
        "male_god_name1": maleGodName1,
        "male_god_name2": maleGodName2,
        "male_god_name3": maleGodName3,
        "female_deity_name": femaleDeityName,
        "female_god_name1": femaleGodName1,
        "female_god_name2": femaleGodName2,
        "female_god_name3": femaleGodName3,
        "other_deity_name": otherDeityName,
        "planet_speciality": planetSpeciality,
        "temple_category": templeCategory,
        "morning_open_time": morningOpenTime,
        "morning_close_time": morningCloseTime,
        "evening_open_time": eveningOpenTime,
        "evening_close_time": eveningCloseTime,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "videos": videos,
        "deity_name": deityName,
        "hrnc": hrnc,
        "organisation": organisation,
        "address": address,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
