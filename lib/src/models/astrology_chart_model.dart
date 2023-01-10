// To parse this JSON data, do
//
//     final astrologyChartModel = astrologyChartModelFromJson(jsonString);

import 'dart:convert';

AstrologyChartModel? astrologyChartModelFromJson(String str) =>
    AstrologyChartModel.fromJson(json.decode(str));

String astrologyChartModelToJson(AstrologyChartModel? data) =>
    json.encode(data!.toJson());

class AstrologyChartModel {
  AstrologyChartModel({
    this.svg,
  });

  String? svg;

  factory AstrologyChartModel.fromJson(Map<String, dynamic> json) =>
      AstrologyChartModel(
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "svg": svg,
      };
}
