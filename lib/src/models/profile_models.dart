// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.token,
    required this.user,
  });

  String token;
  ProfileUser user;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        token: json["token"],
        user: ProfileUser.fromJson(json["User"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "User": user.toJson(),
      };
}

class ProfileUser {
  ProfileUser({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.phoneOtp,
    required this.email,
    this.emailOtp,
    required this.dob,
    required this.place,
    required this.role,
    this.time,
    required this.phoneVerifiedAt,
    required this.emailVerifiedAt,
    required this.accessToken,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  String id;
  String name;
  String phoneNumber;
  dynamic phoneOtp;
  String email;
  dynamic emailOtp;
  String dob;
  String place;
  String role;
  dynamic time;
  String phoneVerifiedAt;
  String emailVerifiedAt;
  String accessToken;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  factory ProfileUser.fromJson(Map<String, dynamic> json) => ProfileUser(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        phoneOtp: json["phone_otp"],
        email: json["email"],
        emailOtp: json["email_otp"],
        dob: json["dob"],
        place: json["place"],
        role: json["role"],
        time: json["time"],
        phoneVerifiedAt: json["phone_verified_at"],
        emailVerifiedAt: json["email_verified_at"],
        accessToken: json["access_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "phone_otp": phoneOtp,
        "email": email,
        "email_otp": emailOtp,
        "dob": dob,
        "place": place,
        "role": role,
        "time": time,
        "phone_verified_at": phoneVerifiedAt,
        "email_verified_at": emailVerifiedAt,
        "access_token": accessToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt.toIso8601String(),
      };
}
