class YearAdhanModel {
  final int code;
  final String status;
  final Data data;

  YearAdhanModel({
    required this.code,
    required this.status,
    required this.data,
  });

  factory YearAdhanModel.fromJson(Map<String, dynamic> json) => YearAdhanModel(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  final List<The1> the1;
  final List<The2> the2;
  final List<The2> the3;
  final List<The2> the4;
  final List<The1> the5;
  final List<The2> the6;
  final List<The2> the7;
  final List<The1> the8;
  final List<The2> the9;
  final List<The1> the10;
  final List<The1> the11;
  final List<The1> the12;

  Data({
    required this.the1,
    required this.the2,
    required this.the3,
    required this.the4,
    required this.the5,
    required this.the6,
    required this.the7,
    required this.the8,
    required this.the9,
    required this.the10,
    required this.the11,
    required this.the12,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        the1: List<The1>.from(json["1"].map((x) => The1.fromJson(x))),
        the2: List<The2>.from(json["2"].map((x) => The2.fromJson(x))),
        the3: List<The2>.from(json["3"].map((x) => The2.fromJson(x))),
        the4: List<The2>.from(json["4"].map((x) => The2.fromJson(x))),
        the5: List<The1>.from(json["5"].map((x) => The1.fromJson(x))),
        the6: List<The2>.from(json["6"].map((x) => The2.fromJson(x))),
        the7: List<The2>.from(json["7"].map((x) => The2.fromJson(x))),
        the8: List<The1>.from(json["8"].map((x) => The1.fromJson(x))),
        the9: List<The2>.from(json["9"].map((x) => The2.fromJson(x))),
        the10: List<The1>.from(json["10"].map((x) => The1.fromJson(x))),
        the11: List<The1>.from(json["11"].map((x) => The1.fromJson(x))),
        the12: List<The1>.from(json["12"].map((x) => The1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "1": List<dynamic>.from(the1.map((x) => x.toJson())),
        "2": List<dynamic>.from(the2.map((x) => x.toJson())),
        "3": List<dynamic>.from(the3.map((x) => x.toJson())),
        "4": List<dynamic>.from(the4.map((x) => x.toJson())),
        "5": List<dynamic>.from(the5.map((x) => x.toJson())),
        "6": List<dynamic>.from(the6.map((x) => x.toJson())),
        "7": List<dynamic>.from(the7.map((x) => x.toJson())),
        "8": List<dynamic>.from(the8.map((x) => x.toJson())),
        "9": List<dynamic>.from(the9.map((x) => x.toJson())),
        "10": List<dynamic>.from(the10.map((x) => x.toJson())),
        "11": List<dynamic>.from(the11.map((x) => x.toJson())),
        "12": List<dynamic>.from(the12.map((x) => x.toJson())),
      };
}

class The1 {
  final Timings timings;
  final The1Date date;
  final Meta meta;

  The1({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        timings: Timings.fromJson(json["timings"]),
        date: The1Date.fromJson(json["date"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "timings": timings.toJson(),
        "date": date.toJson(),
        "meta": meta.toJson(),
      };
}

class The1Date {
  final String readable;
  final String timestamp;
  final Gregorian gregorian;
  final PurpleHijri hijri;

  The1Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  factory The1Date.fromJson(Map<String, dynamic> json) => The1Date(
        readable: json["readable"],
        timestamp: json["timestamp"],
        gregorian: Gregorian.fromJson(json["gregorian"]),
        hijri: PurpleHijri.fromJson(json["hijri"]),
      );

  Map<String, dynamic> toJson() => {
        "readable": readable,
        "timestamp": timestamp,
        "gregorian": gregorian.toJson(),
        "hijri": hijri.toJson(),
      };
}

class Gregorian {
  final String date;
  final String format;
  final String day;
  final GregorianWeekday weekday;
  final GregorianMonth month;
  final String year;
  final Designation designation;

  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: GregorianWeekday.fromJson(json["weekday"]),
        month: GregorianMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
      };
}

class Designation {
  final String abbreviated;
  final String expanded;

  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        abbreviated: json["abbreviated"],
        expanded: json["expanded"],
      );

  Map<String, dynamic> toJson() => {
        "abbreviated": abbreviated,
        "expanded": expanded,
      };
}

class GregorianMonth {
  final int number;
  final String en;

  GregorianMonth({
    required this.number,
    required this.en,
  });

  factory GregorianMonth.fromJson(Map<String, dynamic> json) => GregorianMonth(
        number: json["number"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
      };
}

class GregorianWeekday {
  final String en;

  GregorianWeekday({
    required this.en,
  });

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) => GregorianWeekday(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class PurpleHijri {
  final String date;
  final String format;
  final String day;
  final HijriWeekday weekday;
  final HijriMonth month;
  final String year;
  final Designation designation;
  final List<dynamic> holidays;

  PurpleHijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  factory PurpleHijri.fromJson(Map<String, dynamic> json) => PurpleHijri(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: HijriWeekday.fromJson(json["weekday"]),
        month: HijriMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
        holidays: List<dynamic>.from(json["holidays"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
        "holidays": List<dynamic>.from(holidays.map((x) => x)),
      };
}

class HijriMonth {
  final int number;
  final String en;
  final String ar;

  HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
  });

  factory HijriMonth.fromJson(Map<String, dynamic> json) => HijriMonth(
        number: json["number"],
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
        "ar": ar,
      };
}

class HijriWeekday {
  final String en;
  final String ar;

  HijriWeekday({
    required this.en,
    required this.ar,
  });

  factory HijriWeekday.fromJson(Map<String, dynamic> json) => HijriWeekday(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

class Meta {
  final double latitude;
  final double longitude;
  final String timezone;
  final Method method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Offset offset;

  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        timezone: json["timezone"],
        method: Method.fromJson(json["method"]),
        latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
        midnightMode: json["midnightMode"],
        school: json["school"],
        offset: Offset.fromJson(json["offset"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "method": method.toJson(),
        "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
        "midnightMode": midnightMode,
        "school": school,
        "offset": offset.toJson(),
      };
}

class Method {
  final int id;
  final String name;
  final Params params;
  final Location location;

  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        id: json["id"],
        name: json["name"],
        params: Params.fromJson(json["params"]),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "params": params.toJson(),
        "location": location.toJson(),
      };
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Params {
  final double fajr;
  final double isha;

  Params({
    required this.fajr,
    required this.isha,
  });

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        fajr: json["Fajr"]?.toDouble(),
        isha: json["Isha"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Isha": isha,
      };
}

class Offset {
  final int imsak;
  final int fajr;
  final int sunrise;
  final int dhuhr;
  final int asr;
  final int maghrib;
  final int sunset;
  final int isha;
  final int midnight;

  Offset({
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.sunset,
    required this.isha,
    required this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => Offset(
        imsak: json["Imsak"],
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        maghrib: json["Maghrib"],
        sunset: json["Sunset"],
        isha: json["Isha"],
        midnight: json["Midnight"],
      );

  Map<String, dynamic> toJson() => {
        "Imsak": imsak,
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Maghrib": maghrib,
        "Sunset": sunset,
        "Isha": isha,
        "Midnight": midnight,
      };
}

class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstthird;
  final String lastthird;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstthird,
    required this.lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
        midnight: json["Midnight"],
        firstthird: json["Firstthird"],
        lastthird: json["Lastthird"],
      );

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Imsak": imsak,
        "Midnight": midnight,
        "Firstthird": firstthird,
        "Lastthird": lastthird,
      };
}

class The2 {
  final Timings timings;
  final The2Date date;
  final Meta meta;

  The2({
    required this.timings,
    required this.date,
    required this.meta,
  });

  factory The2.fromJson(Map<String, dynamic> json) => The2(
        timings: Timings.fromJson(json["timings"]),
        date: The2Date.fromJson(json["date"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "timings": timings.toJson(),
        "date": date.toJson(),
        "meta": meta.toJson(),
      };
}

class The2Date {
  final String readable;
  final String timestamp;
  final Gregorian gregorian;
  final FluffyHijri hijri;

  The2Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  factory The2Date.fromJson(Map<String, dynamic> json) => The2Date(
        readable: json["readable"],
        timestamp: json["timestamp"],
        gregorian: Gregorian.fromJson(json["gregorian"]),
        hijri: FluffyHijri.fromJson(json["hijri"]),
      );

  Map<String, dynamic> toJson() => {
        "readable": readable,
        "timestamp": timestamp,
        "gregorian": gregorian.toJson(),
        "hijri": hijri.toJson(),
      };
}

class FluffyHijri {
  final String date;
  final String format;
  final String day;
  final HijriWeekday weekday;
  final HijriMonth month;
  final String year;
  final Designation designation;
  final List<String> holidays;

  FluffyHijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  factory FluffyHijri.fromJson(Map<String, dynamic> json) => FluffyHijri(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: HijriWeekday.fromJson(json["weekday"]),
        month: HijriMonth.fromJson(json["month"]),
        year: json["year"],
        designation: Designation.fromJson(json["designation"]),
        holidays: List<String>.from(json["holidays"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
        "holidays": List<dynamic>.from(holidays.map((x) => x)),
      };
}
