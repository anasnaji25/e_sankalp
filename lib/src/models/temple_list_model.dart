// To parse this JSON data, do
//
//     final templeModel = templeModelFromJson(jsonString);

import 'dart:convert';

TempleListModel? templeModelFromJson(String str) =>
    TempleListModel.fromJson(json.decode(str));

String templeModelToJson(TempleListModel? data) => json.encode(data!.toJson());

class TempleListModel {
  TempleListModel({
    this.message,
    this.temple,
  });

  String? message;
  Temple? temple;

  factory TempleListModel.fromJson(Map<String, dynamic> json) =>
      TempleListModel(
        message: json["message"],
        temple: Temple.fromJson(json["temple"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "temple": temple!.toJson(),
      };
}

class Temple {
  Temple({
    this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  dynamic currentPage;
  List<TempleData> data;
  dynamic firstPageUrl;
  dynamic from;
  dynamic lastPage;
  dynamic lastPageUrl;

  dynamic nextPageUrl;
  dynamic path;
  dynamic perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  factory Temple.fromJson(Map<String, dynamic> json) => Temple(
        currentPage: json["current_page"],
        data:  List<TempleData>.from(
                json["data"]!.map((x) => TempleData.fromJson(x))),
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
        "data":
            data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
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
    this.maleDeityName,
    this.maleGodName1,
    this.maleGodName2,
    this.maleGodName3,
    this.femaleDeityName,
    this.femaleGodName1,
    this.femaleGodName2,
    this.femaleGodName3,
    this.otherDeityName,
    required this.planetSpeciality,
    required this.templeCategory,
    required this.morningOpenTime,
    required this.morningCloseTime,
    required this.eveningOpenTime,
    required this.eveningCloseTime,
    required this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.videos,
    required this.deityName,
    required this.hrnc,
    required this.organisation,
    required this.address,
    required this.phone,
    required this.poojasId,
    required this.poojariId,
    required this.createdAt,
    required this.updatedAt,
    required this.poojas,
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
  dynamic planetSpeciality;
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
  dynamic poojasId;
  dynamic poojariId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Pooja> poojas;

  factory TempleData.fromJson(Map<String, dynamic> json) => TempleData(
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
        poojasId: json["poojas_id"],
        poojariId: json["poojari_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        poojas: json["poojas"] == [] || json["poojas"] == null
            ? []
            : List<Pooja>.from(json["poojas"].map((x) => Pooja.fromJson(x))),
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
        "poojas_id": poojasId,
        "poojari_id": poojariId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "poojas": poojas == null
            ? []
            : List<dynamic>.from(poojas.map((x) => x.toJson())),
      };
}

class Pooja {
  Pooja({
    required this.id,
    required this.templeId,
    required this.poojaName,
    required this.poojaCost,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String templeId;
  String poojaName;
  String poojaCost;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pooja.fromJson(Map<String, dynamic> json) => Pooja(
        id: json["id"],
        templeId: json["temple_id"],
        poojaName: json["pooja_name"],
        poojaCost: json["pooja_cost"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "temple_id": templeId,
        "pooja_name": poojaName,
        "pooja_cost": poojaCost,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
