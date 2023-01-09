// To parse this JSON data, do
//
//     final donationsLIstModel = donationsLIstModelFromJson(jsonString);

import 'dart:convert';

DonationsListModel? donationsLIstModelFromJson(String str) =>
    DonationsListModel.fromJson(json.decode(str));

String donationsLIstModelToJson(DonationsListModel? data) =>
    json.encode(data!.toJson());

class DonationsListModel {
  DonationsListModel({
    this.message,
    this.donate,
  });

  String? message;
  Donate? donate;

  factory DonationsListModel.fromJson(Map<String, dynamic> json) =>
      DonationsListModel(
        message: json["message"],
        donate: Donate.fromJson(json["Donate"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "Donate": donate!.toJson(),
      };
}

class Donate {
  Donate({
    this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<DonateData> data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link?>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Donate.fromJson(Map<String, dynamic> json) => Donate(
        currentPage: json["current_page"],
        data: json["data"] == null || json["data"] == []
            ? []
            : List<DonateData>.from(
                json["data"]!.map((x) => DonateData.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link?>.from(json["links"]!.map((x) => Link.fromJson(x))),
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
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x!.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class DonateData {
  DonateData({
    required this.id,
    required this.donateTitle,
    required this.donateDescription,
    required this.image,
    required this.raisedOfGoal,
    required this.archievedGoal,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String donateTitle;
  String donateDescription;
  String image;
  String raisedOfGoal;
  String archievedGoal;
  String createdAt;
  String updatedAt;

  factory DonateData.fromJson(Map<String, dynamic> json) => DonateData(
        id: json["id"],
        donateTitle: json["donate_title"],
        donateDescription: json["donate_description"],
        image: json["image"],
        raisedOfGoal: json["raised_of_goal"],
        archievedGoal: json["archieved_goal"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "donate_title": donateTitle,
        "donate_description": donateDescription,
        "image": image,
        "raised_of_goal": raisedOfGoal,
        "archieved_goal": archievedGoal,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
