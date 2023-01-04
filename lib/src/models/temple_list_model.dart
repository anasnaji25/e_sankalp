// To parse this JSON data, do
//
//     final templeListModel = templeListModelFromJson(jsonString);

import 'dart:convert';

TempleListModel templeListModelFromJson(String str) =>
    TempleListModel.fromJson(json.decode(str));

String templeListModelToJson(TempleListModel data) =>
    json.encode(data.toJson());

class TempleListModel {
  TempleListModel({
    required this.message,
    required this.temple,
  });

  String message;
  Temple temple;

  factory TempleListModel.fromJson(Map<String, dynamic> json) =>
      TempleListModel(
        message: json["message"],
        temple: Temple.fromJson(json["temple"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "temple": temple.toJson(),
      };
}

class Temple {
  Temple({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<TempleData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;

  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Temple.fromJson(Map<String, dynamic> json) => Temple(
        currentPage: json["current_page"],
        data: List<TempleData>.from(
            json["data"].map((x) => TempleData.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class TempleData {
  TempleData({
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
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.videos,
    this.deityName,
    required this.hrnc,
    required this.organisation,
    required this.address,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String templeName;
  String maleDeityName;
  dynamic maleGodName1;
  dynamic maleGodName2;
  dynamic maleGodName3;
  String femaleDeityName;
  dynamic femaleGodName1;
  dynamic femaleGodName2;
  dynamic femaleGodName3;
  String otherDeityName;
  String planetSpeciality;
  String templeCategory;
  String morningOpenTime;
  String morningCloseTime;
  String eveningOpenTime;
  String eveningCloseTime;
  dynamic image1;
  dynamic image2;
  dynamic image3;
  dynamic image4;
  dynamic videos;
  dynamic deityName;
  String hrnc;
  String organisation;
  String address;
  String phone;
  DateTime createdAt;
  DateTime updatedAt;

  factory TempleData.fromJson(Map<String, dynamic> json) => TempleData(
        id: json["id"],
        templeName: json["temple_name"],
        maleDeityName:
            json["male_deity_name"] ?? "",
        maleGodName1: json["male_god_name1"],
        maleGodName2: json["male_god_name2"],
        maleGodName3: json["male_god_name3"],
        femaleDeityName: json["female_deity_name"] ?? "",
        femaleGodName1: json["female_god_name1"],
        femaleGodName2: json["female_god_name2"],
        femaleGodName3: json["female_god_name3"],
        otherDeityName:
            json["other_deity_name"] ?? "",
        planetSpeciality: json["planet_speciality"],
        templeCategory:
            json["temple_category"] ?? "",
        morningOpenTime: json["morning_open_time"] ?? "",
        morningCloseTime: json["morning_close_time"] ?? "",
        eveningOpenTime: json["evening_open_time"] ?? "",
        eveningCloseTime: json["evening_close_time"] ?? "",
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        videos: json["videos"],
        deityName: json["deity_name"],
        hrnc: json["hrnc"] ?? "",
        organisation:
            json["organisation"] ?? "",
        address: json["address"]?? "",
        phone: json["phone"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "temple_name": templeName,
        "male_deity_name": maleDeityName == null ? null : maleDeityName,
        "male_god_name1": maleGodName1,
        "male_god_name2": maleGodName2,
        "male_god_name3": maleGodName3,
        "female_deity_name": femaleDeityName == null ? null : femaleDeityName,
        "female_god_name1": femaleGodName1,
        "female_god_name2": femaleGodName2,
        "female_god_name3": femaleGodName3,
        "other_deity_name": otherDeityName == null ? null : otherDeityName,
        "planet_speciality": planetSpeciality,
        "temple_category": templeCategory == null ? null : templeCategory,
        "morning_open_time": morningOpenTime == null ? null : morningOpenTime,
        "morning_close_time":
            morningCloseTime == null ? null : morningCloseTime,
        "evening_open_time": eveningOpenTime == null ? null : eveningOpenTime,
        "evening_close_time":
            eveningCloseTime == null ? null : eveningCloseTime,
        "image1": image1 == null ? null : image1,
        "image2": image2 == null ? null : image2,
        "image3": image3 == null ? null : image3,
        "image4": image4 == null ? null : image4,
        "videos": videos == null ? null : videos,
        "deity_name": deityName == null ? null : deityName,
        "hrnc": hrnc == null ? null : hrnc,
        "organisation": organisation == null ? null : organisation,
        "address": address == null ? null : address,
        "phone": phone == null ? null : phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

// class Link {
//   Link({
//     this.url,
//     this.label,
//     this.active,
//   });

//   String url;
//   String label;
//   bool active;

//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"] == null ? null : json["url"],
//         label: json["label"],
//         active: json["active"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url == null ? null : url,
//         "label": label,
//         "active": active,
//       };
// }
