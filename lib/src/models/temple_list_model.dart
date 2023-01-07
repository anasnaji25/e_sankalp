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
    required this.poojas,
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
  Poojas poojas;

  factory TempleData.fromJson(Map<String, dynamic> json) => TempleData(
        id: json["id"],
        templeName: json["temple_name"],
        maleDeityName: json["male_deity_name"] ?? "",
        maleGodName1: json["male_god_name1"],
        maleGodName2: json["male_god_name2"],
        maleGodName3: json["male_god_name3"],
        femaleDeityName: json["female_deity_name"] ?? "",
        femaleGodName1: json["female_god_name1"],
        femaleGodName2: json["female_god_name2"],
        femaleGodName3: json["female_god_name3"],
        otherDeityName: json["other_deity_name"] ?? "",
        planetSpeciality: json["planet_speciality"],
        templeCategory: json["temple_category"] ?? "",
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
        organisation: json["organisation"] ?? "",
        address: json["address"] ?? "",
        phone: json["phone"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        poojas: Poojas.fromJson(json["poojas"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "temple_name": templeName,
        "male_deity_name": maleDeityName,
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

class Poojas {
  Poojas({
    required this.id,
    required this.templeId,
    required this.archanaName,
    required this.archanaCost,
    required this.poojaName1,
    required this.poojaCost1,
    this.others,
    required this.poojaName2,
    required this.poojaCost2,
    required this.poojaName3,
    required this.poojaCost3,
    required this.poojaName4,
    required this.poojaCost4,
    required this.poojaName5,
    required this.poojaCost5,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String templeId;
  String archanaName;
  String archanaCost;
  String poojaName1;
  String poojaCost1;
  dynamic others;
  String poojaName2;
  String poojaCost2;
  String poojaName3;
  String poojaCost3;
  String poojaName4;
  String poojaCost4;
  String poojaName5;
  String poojaCost5;
  DateTime createdAt;
  DateTime updatedAt;

  factory Poojas.fromJson(Map<String, dynamic> json) => Poojas(
        id: json["id"],
        templeId: json["temple_id"],
        archanaName: json["archana_name"] ?? "null",
        archanaCost: json["archana_cost"] ?? "null",
        poojaName1: json["pooja_name1"] ?? "null",
        poojaCost1: json["pooja_cost1"] ?? "null",
        others: json["others"],
        poojaName2: json["pooja_name2"] ?? "null",
        poojaCost2: json["pooja_cost2"] ?? "null",
        poojaName3: json["pooja_name3"] ?? "null",
        poojaCost3: json["pooja_cost3"] ?? "null",
        poojaName4: json["pooja_name4"] ?? "null",
        poojaCost4: json["pooja_cost4"] ?? "null",
        poojaName5: json["pooja_name5"] ?? "null",
        poojaCost5: json["pooja_cost5"] ?? "null",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "temple_id": templeId,
        "archana_name": archanaName == null ? null : archanaName,
        "archana_cost": archanaCost == null ? null : archanaCost,
        "pooja_name1": poojaName1,
        "pooja_cost1": poojaCost1,
        "others": others,
        "pooja_name2": poojaName2,
        "pooja_cost2": poojaCost2 == null ? null : poojaCost2,
        "pooja_name3": poojaName3 == null ? null : poojaName3,
        "pooja_cost3": poojaCost3 == null ? null : poojaCost3,
        "pooja_name4": poojaName4 == null ? null : poojaName4,
        "pooja_cost4": poojaCost4 == null ? null : poojaCost4,
        "pooja_name5": poojaName5 == null ? null : poojaName5,
        "pooja_cost5": poojaCost5 == null ? null : poojaCost5,
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
