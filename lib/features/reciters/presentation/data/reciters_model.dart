class RecitersModel {
    final List<Reciter> reciters;

    RecitersModel({
        required this.reciters,
    });

    factory RecitersModel.fromJson(Map<String, dynamic> json) => RecitersModel(
        reciters: List<Reciter>.from(json["reciters"].map((x) => Reciter.fromJson(x))),
    );

   
}

class Reciter {
    final int id;
    final String name;
    final String letter;
    final String date;
    final List<Moshaf> moshaf;

    Reciter({
        required this.id,
        required this.name,
        required this.letter,
        required this.date,
        required this.moshaf,
    });

    factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
        id: json["id"],
        name: json["name"],
        letter: json["letter"],
        date: json["date"],
        moshaf: List<Moshaf>.from(json["moshaf"].map((x) => Moshaf.fromJson(x))),
    );

    
}

class Moshaf {
    final int id;
    final String name;
    final String server;
    final int surahTotal;
    final int moshafType;
    final String surahList;

    Moshaf({
        required this.id,
        required this.name,
        required this.server,
        required this.surahTotal,
        required this.moshafType,
        required this.surahList,
    });

    factory Moshaf.fromJson(Map<String, dynamic> json) => Moshaf(
        id: json["id"],
        name: json["name"],
        server: json["server"],
        surahTotal: json["surah_total"],
        moshafType: json["moshaf_type"],
        surahList: json["surah_list"],
    );

    
}
