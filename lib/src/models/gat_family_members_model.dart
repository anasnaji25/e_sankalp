// To parse this JSON data, do
//
//     final familyMembersModel = familyMembersModelFromJson(jsonString);

import 'dart:convert';

FamilyMembersModel familyMembersModelFromJson(String str) =>
    FamilyMembersModel.fromJson(json.decode(str));

String familyMembersModelToJson(FamilyMembersModel data) =>
    json.encode(data.toJson());

class FamilyMembersModel {
  FamilyMembersModel({
    required this.message,
    required this.member,
  });

  String message;
  List<Member> member;

  factory FamilyMembersModel.fromJson(Map<String, dynamic> json) =>
      FamilyMembersModel(
        message: json["message"],
        member:
            List<Member>.from(json["member"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "member": List<dynamic>.from(member.map((x) => x.toJson())),
      };
}

class Member {
  Member({
    required this.id,
    required this.userId,
    required this.name,
    required this.nakshtraType,
    required this.dob,
    required this.mobileNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String userId;
  String name;
  String nakshtraType;
  String dob;
  String mobileNumber;
  DateTime createdAt;
  DateTime updatedAt;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        nakshtraType: json["nakshtra_type"],
        dob: json["dob"],
        mobileNumber: json["mobile_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "nakshtra_type": nakshtraType,
        "dob": dob,
        "mobile_number": mobileNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
