// To parse this JSON data, do
//
//     final PlanetsModel = PlanetsModelFromJson(jsonString);

import 'dart:convert';

List<PlanetsModel> planetsModelFromJson(List<dynamic> str) =>
    List<PlanetsModel>.from(str.map((x) => PlanetsModel.fromJson(x)));

class PlanetsModel {
  PlanetsModel({
    required this.id,
    required this.name,
    required this.activeFlag,
  });

  String id;
  String name;
  String activeFlag;

  factory PlanetsModel.fromJson(Map<String, dynamic> json) => PlanetsModel(
        id: json["id"],
        name: json["name"],
        activeFlag: json["active_flag"],
      );
}
