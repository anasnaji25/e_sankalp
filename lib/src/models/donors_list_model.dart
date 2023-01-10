// To parse this JSON data, do
//
//     final supportersLIstModel = supportersLIstModelFromJson(jsonString);

import 'dart:convert';

SupportersLIstModel? supportersLIstModelFromJson(String str) =>
    SupportersLIstModel.fromJson(json.decode(str));

String supportersLIstModelToJson(SupportersLIstModel? data) =>
    json.encode(data!.toJson());

class SupportersLIstModel {
  SupportersLIstModel({
    this.message,
    this.donor,
  });

  String? message;
  List<Donor?>? donor;

  factory SupportersLIstModel.fromJson(Map<String, dynamic> json) =>
      SupportersLIstModel(
        message: json["message"],
        donor: json["Donor"] == null
            ? []
            : List<Donor?>.from(json["Donor"]!.map((x) => Donor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "Donor": donor == null
            ? []
            : List<dynamic>.from(donor!.map((x) => x!.toJson())),
      };
}

class Donor {
  Donor({
    this.id,
    this.userId,
    this.donateId,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.state,
    this.country,
    this.pincode,
    this.amount,
    this.status,
    this.isAnonyms,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? donateId;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? state;
  String? country;
  String? pincode;
  String? amount;
  dynamic status;
  String? isAnonyms;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Donor.fromJson(Map<String, dynamic> json) => Donor(
        id: json["id"],
        userId: json["user_id"],
        donateId: json["donate_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
        amount: json["amount"],
        status: json["status"],
        isAnonyms: json["is_anonyms"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "donate_id": donateId,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "state": state,
        "country": country,
        "pincode": pincode,
        "amount": amount,
        "status": status,
        "is_anonyms": isAnonyms,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
