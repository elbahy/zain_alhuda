class QuranModel {
  QuranModel({
    required this.data,
  });

  final List<Datum> data;

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}

class Datum {
  Datum({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<Ayah> ayahs;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      number: json["number"],
      name: json["name"],
      englishName: json["englishName"],
      englishNameTranslation: json["englishNameTranslation"],
      revelationType: json["revelationType"],
      ayahs: json["ayahs"] == null
          ? []
          : List<Ayah>.from(json["ayahs"]!.map((x) => Ayah.fromJson(x))),
    );
  }
}

class Ayah {
  Ayah({
    required this.number,
    required this.text,
    required this.tafseer,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  final int number;
  final String text;
  final String? tafseer;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final dynamic sajda;

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json["number"],
      text: json["text"],
      tafseer: json["tafseer"],
      numberInSurah: json["numberInSurah"],
      juz: json["juz"],
      manzil: json["manzil"],
      page: json["page"],
      ruku: json["ruku"],
      hizbQuarter: json["hizbQuarter"],
      sajda: json["sajda"],
    );
  }
}

class SajdaClass {
  SajdaClass({
    required this.id,
    required this.recommended,
    required this.obligatory,
  });

  final int id;
  final bool recommended;
  final bool obligatory;

  factory SajdaClass.fromJson(Map<String, dynamic> json) {
    return SajdaClass(
      id: json["id"],
      recommended: json["recommended"],
      obligatory: json["obligatory"],
    );
  }
}
