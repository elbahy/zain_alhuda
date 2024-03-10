import 'dart:convert';

import 'package:zain_alhuda/core/api/api_strings.dart';

SurahModel surahFromJson(String str) =>
    json.decode(str).List((x) => SurahModel.fromJson(x));

class SurahModel {
  final List<SurahDataModel> data;

  SurahModel({
    required this.data,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      data: List<SurahDataModel>.from(
          json[ApiStrings.data].map((x) => SurahDataModel.fromJson(x))),
    );
  }
}

class SurahDataModel {
  final int number;
  final String name;
  final String englishName;
  final int numberOfAyahs;
  final String revelationType;

  SurahDataModel(
      {required this.number,
      required this.name,
      required this.englishName,
      required this.numberOfAyahs,
      required this.revelationType});

  factory SurahDataModel.fromJson(Map<String, dynamic> json) {
    return SurahDataModel(
      number: json[ApiStrings.number],
      name: json[ApiStrings.name],
      englishName: json[ApiStrings.englishName],
      numberOfAyahs: json[ApiStrings.numberOfAyahs],
      revelationType: json[ApiStrings.revelationType],
    );
  }
}
