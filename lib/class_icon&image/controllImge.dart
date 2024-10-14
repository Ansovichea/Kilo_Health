// To parse this JSON data, do
//
//     final dataSlide = dataSlideFromJson(jsonString);

import 'dart:convert';

DataSlide dataSlideFromJson(String str) => DataSlide.fromJson(json.decode(str));

String dataSlideToJson(DataSlide data) => json.encode(data.toJson());

class DataSlide {
  int status;
  String message;
  SliderDataModel data;

  DataSlide({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DataSlide.fromJson(Map<String, dynamic> json) => DataSlide(
        status: json["status"],
        message: json["message"],
        data: SliderDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class SliderDataModel {
  List<String> slides;
  String name;
  String description;
  String facebook;
  String telegram;
  String tiktok;
  String youtube;
  String email;
  List<String> phoneNumbers;

  SliderDataModel({
    required this.slides,
    required this.name,
    required this.description,
    required this.facebook,
    required this.telegram,
    required this.tiktok,
    required this.youtube,
    required this.email,
    required this.phoneNumbers,
  });

  factory SliderDataModel.fromJson(Map<String, dynamic> json) =>
      SliderDataModel(
        slides: List<String>.from(json["slides"].map((x) => x)),
        name: json["name"],
        description: json["description"],
        facebook: json["facebook"],
        telegram: json["telegram"],
        tiktok: json["tiktok"],
        youtube: json["youtube"],
        email: json["email"],
        phoneNumbers: List<String>.from(json["phoneNumbers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "slides": List<dynamic>.from(slides.map((x) => x)),
        "name": name,
        "description": description,
        "facebook": facebook,
        "telegram": telegram,
        "tiktok": tiktok,
        "youtube": youtube,
        "email": email,
        "phoneNumbers": List<dynamic>.from(phoneNumbers.map((x) => x)),
      };
}
