// To parse this JSON data, do
//
//     final astrologyModel = astrologyModelFromJson(jsonString);

import 'dart:convert';

AstrologyModel? astrologyModelFromJson(String str) =>
    AstrologyModel.fromJson(json.decode(str));

String astrologyModelToJson(AstrologyModel? data) =>
    json.encode(data!.toJson());

class AstrologyModel {
  AstrologyModel({
    this.message,
    this.astrology,
  });

  String? message;
  Astrology? astrology;

  factory AstrologyModel.fromJson(Map<String, dynamic> json) => AstrologyModel(
        message: json["message"],
        astrology: Astrology.fromJson(json["Astrology"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "Astrology": astrology!.toJson(),
      };
}

class Astrology {
  Astrology({
    this.ascendant,
    this.ascendantLord,
    this.varna,
    this.vashya,
    this.yoni,
    this.gan,
    this.nadi,
    this.signLord,
    this.sign,
    this.naksahtra,
    this.naksahtraLord,
    this.charan,
    this.yog,
    this.karan,
    this.tithi,
    this.yunja,
    this.tatva,
    this.nameAlphabet,
    this.paya,
  });

  String? ascendant;
  String? ascendantLord;
  String? varna;
  String? vashya;
  String? yoni;
  String? gan;
  String? nadi;
  String? signLord;
  String? sign;
  String? naksahtra;
  String? naksahtraLord;
  int? charan;
  String? yog;
  String? karan;
  String? tithi;
  String? yunja;
  String? tatva;
  String? nameAlphabet;
  String? paya;

  factory Astrology.fromJson(Map<String, dynamic> json) => Astrology(
        ascendant: json["ascendant"],
        ascendantLord: json["ascendant_lord"],
        varna: json["Varna"],
        vashya: json["Vashya"],
        yoni: json["Yoni"],
        gan: json["Gan"],
        nadi: json["Nadi"],
        signLord: json["SignLord"],
        sign: json["sign"],
        naksahtra: json["Naksahtra"],
        naksahtraLord: json["NaksahtraLord"],
        charan: json["Charan"],
        yog: json["Yog"],
        karan: json["Karan"],
        tithi: json["Tithi"],
        yunja: json["yunja"],
        tatva: json["tatva"],
        nameAlphabet: json["name_alphabet"],
        paya: json["paya"],
      );

  Map<String, dynamic> toJson() => {
        "ascendant": ascendant,
        "ascendant_lord": ascendantLord,
        "Varna": varna,
        "Vashya": vashya,
        "Yoni": yoni,
        "Gan": gan,
        "Nadi": nadi,
        "SignLord": signLord,
        "sign": sign,
        "Naksahtra": naksahtra,
        "NaksahtraLord": naksahtraLord,
        "Charan": charan,
        "Yog": yog,
        "Karan": karan,
        "Tithi": tithi,
        "yunja": yunja,
        "tatva": tatva,
        "name_alphabet": nameAlphabet,
        "paya": paya,
      };
}
