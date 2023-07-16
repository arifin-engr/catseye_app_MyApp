// To parse this JSON data, do
//
//     final catsHomeBanner = catsHomeBannerFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CatsHomeBanner> catsHomeBannerFromJson(String str) =>
    List<CatsHomeBanner>.from(
        json.decode(str).map((x) => CatsHomeBanner.fromJson(x)));

class CatsHomeBanner {
  String homeImage;
  dynamic title;
  dynamic subtitle;
  int id;
  DateTime createdDate;
  DateTime updatedDate;
  dynamic createdBy;
  dynamic updatedBy;

  CatsHomeBanner({
    required this.homeImage,
    required this.title,
    required this.subtitle,
    required this.id,
    required this.createdDate,
    required this.updatedDate,
    required this.createdBy,
    required this.updatedBy,
  });

  factory CatsHomeBanner.fromJson(Map<String, dynamic> json) => CatsHomeBanner(
        homeImage: json["homeImage"],
        title: json["title"],
        subtitle: json["subtitle"],
        id: json["id"],
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
      );
}
