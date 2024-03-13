import 'dart:convert';

import 'package:zain_alhuda/core/api/api_strings.dart';

SurahListModel surahFromJson(String str) =>
    json.decode(str).List((x) => SurahListModel.fromJson(x));

class SurahListModel {
  final List<SurahListDataModel> data;

  SurahListModel({
    required this.data,
  });

  factory SurahListModel.fromJson(Map<String, dynamic> json) {
    return SurahListModel(
      data: List<SurahListDataModel>.from(
          json[ApiStrings.data].map((x) => SurahListDataModel.fromJson(x))),
    );
  }
}

class SurahListDataModel {
  final int number;
  final String name;
  final String englishName;
  final int numberOfAyahs;
  final String revelationType;

  SurahListDataModel(
      {required this.number,
      required this.name,
      required this.englishName,
      required this.numberOfAyahs,
      required this.revelationType});

  factory SurahListDataModel.fromJson(Map<String, dynamic> json) {
    return SurahListDataModel(
      number: json[ApiStrings.number],
      name: json[ApiStrings.name],
      englishName: json[ApiStrings.englishName],
      numberOfAyahs: json[ApiStrings.numberOfAyahs],
      revelationType: json[ApiStrings.revelationType],
    );
  }
}
