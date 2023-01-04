// To parse this JSON data, do
//
//     final templeDetailsModel = templeDetailsModelFromJson(jsonString);

import 'dart:convert';

TempleDetailsModel templeDetailsModelFromJson(String str) =>
    TempleDetailsModel.fromJson(json.decode(str));

String templeDetailsModelToJson(TempleDetailsModel data) =>
    json.encode(data.toJson());

class TempleDetailsModel {
  TempleDetailsModel({
    required this.message,
    required this.templeDetails,
  });

  String message;
  List<TempleDetail> templeDetails;

  factory TempleDetailsModel.fromJson(Map<String, dynamic> json) =>
      TempleDetailsModel(
        message: json["message"],
        templeDetails: List<TempleDetail>.from(
            json["temple_details"].map((x) => TempleDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "temple_details":
            List<dynamic>.from(templeDetails.map((x) => x.toJson())),
      };
}

class TempleDetail {
  TempleDetail({
    required this.id,
    required this.templeId,
    required this.history,
    required this.architecture,
    required this.significance,
    required this.miscellanous,
    required this.specialFeatures,
    required this.otherDeities,
    required this.festivals,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String templeId;
  String history;
  String architecture;
  String significance;
  String miscellanous;
  String specialFeatures;
  String otherDeities;
  String festivals;
  DateTime createdAt;
  DateTime updatedAt;

  factory TempleDetail.fromJson(Map<String, dynamic> json) => TempleDetail(
        id: json["id"],
        templeId: json["temple_id"],
        history: json["history"],
        architecture: json["architecture"],
        significance: json["significance"],
        miscellanous: json["miscellanous"],
        specialFeatures: json["special_features"],
        otherDeities: json["other_deities"],
        festivals: json["festivals"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "temple_id": templeId,
        "history": history,
        "architecture": architecture,
        "significance": significance,
        "miscellanous": miscellanous,
        "special_features": specialFeatures,
        "other_deities": otherDeities,
        "festivals": festivals,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
