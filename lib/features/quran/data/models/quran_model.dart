class QuranModel {
  final int code;
  final String status;
  final QuranDataModel data;

  QuranModel({
    required this.code,
    required this.status,
    required this.data,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      code: json['code'],
      status: json['status'],
      data: QuranDataModel.fromJson(json['data']),
    );
  }
}

class QuranDataModel {
  final List<QuranSurahModel> surahs;
  final Edition edition;

  QuranDataModel({
    required this.surahs,
    required this.edition,
  });

  factory QuranDataModel.fromJson(Map<String, dynamic> json) {
    return QuranDataModel(
      surahs: List<QuranSurahModel>.from(
          json['surahs'].map((x) => QuranSurahModel.fromJson(x))),
      edition: Edition.fromJson(json['edition']),
    );
  }
}

class Edition {
  final String identifier;
  final String language;
  final String name;
  final String englishName;
  final String format;
  final String type;

  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });

  factory Edition.fromJson(Map<String, dynamic> json) {
    return Edition(
      identifier: json['identifier'],
      language: json['language'],
      name: json['name'],
      englishName: json['englishName'],
      format: json['format'],
      type: json['type'],
    );
  }
}

class QuranSurahModel {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<QuranAyahModel> ayahs;

  QuranSurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  factory QuranSurahModel.fromJson(Map<String, dynamic> json) {
    return QuranSurahModel(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      revelationType: json['revelationType'],
      ayahs: List<QuranAyahModel>.from(
          json['ayahs'].map((x) => QuranAyahModel.fromJson(x))),
    );
  }
}

class QuranAyahModel {
  final int number;
  final String audio;
  final List<String> audioSecondary;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final dynamic sajda;

  QuranAyahModel({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });
  factory QuranAyahModel.fromJson(Map<String, dynamic> json) {
    return QuranAyahModel(
      number: json['number'],
      audio: json['audio'],
      audioSecondary: List<String>.from(json['audioSecondary'].map((x) => x)),
      text: json['text'],
      numberInSurah: json['numberInSurah'],
      juz: json['juz'],
      manzil: json['manzil'],
      page: json['page'],
      ruku: json['ruku'],
      hizbQuarter: json['hizbQuarter'],
      sajda: json['sajda'],
    );
  }
}

class SajdaClass {
  final int id;
  final bool recommended;
  final bool obligatory;

  SajdaClass({
    required this.id,
    required this.recommended,
    required this.obligatory,
  });
}
