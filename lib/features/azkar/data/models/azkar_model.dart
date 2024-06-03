// To parse this JSON data, do
//
//     final azkarModel = azkarModelFromJson(jsonString);

class AzkarModel {
  final List<Datum> data;

  AzkarModel({
    required this.data,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final String title;
  final List<Content> content;

  Datum({
    required this.id,
    required this.title,
    required this.content,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
      };
}

class Content {
  final int id;
  final String zekr;
  final int repeat;
  final String bless;

  Content({
    required this.id,
    required this.zekr,
    required this.repeat,
    required this.bless,
  });

  Content copyWith({
    int? id,
    String? zekr,
    int? repeat,
    String? bless,
  }) =>
      Content(
        id: id ?? this.id,
        zekr: zekr ?? this.zekr,
        repeat: repeat ?? this.repeat,
        bless: bless ?? this.bless,
      );

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        zekr: json["zekr"],
        repeat: json["repeat"],
        bless: json["bless"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zekr": zekr,
        "repeat": repeat,
        "bless": bless,
      };
}
