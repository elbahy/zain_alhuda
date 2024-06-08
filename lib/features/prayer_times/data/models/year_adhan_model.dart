class YearAdhanModel {
  YearAdhanModel({
    required this.code,
    required this.status,
    required this.data,
  });

  final int code;
  final String status;
  final Map<String, List<Datum>> data;

  factory YearAdhanModel.fromJson(Map<String, dynamic> json) {
    return YearAdhanModel(
      code: json["code"],
      status: json["status"],
      data: Map.from(json["data"]).map((k, v) => MapEntry<String, List<Datum>>(k, v == null ? [] : List<Datum>.from(v!.map((x) => Datum.fromJson(x))))),
    );
  }
}

class Datum {
  Datum({
    required this.timings,
    required this.date,
    required this.meta,
  });

  final Timings timings;
  final Date date;
  final Meta meta;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      timings: json["timings"],
      date: json["date"],
      meta: json["meta"],
    );
  }
}

class Date {
  Date({
    required this.readable,
    required this.timestamp,
    required this.gregorian,
    required this.hijri,
  });

  final String readable;
  final String timestamp;
  final Gregorian gregorian;
  final Hijri hijri;

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      readable: json["readable"],
      timestamp: json["timestamp"],
      gregorian: json["gregorian"],
      hijri: json["hijri"],
    );
  }
}

class Gregorian {
  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  final String date;
  final String format;
  final String day;
  final GregorianWeekday weekday;
  final GregorianMonth month;
  final String year;
  final Designation designation;

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(
      date: json["date"],
      format: json["format"],
      day: json["day"],
      weekday: json["weekday"],
      month: json["month"],
      year: json["year"],
      designation: json["designation"],
    );
  }
}

class Designation {
  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  final String abbreviated;
  final String expanded;

  factory Designation.fromJson(Map<String, dynamic> json) {
    return Designation(
      abbreviated: json["abbreviated"],
      expanded: json["expanded"],
    );
  }
}

class GregorianMonth {
  GregorianMonth({
    required this.number,
    required this.en,
  });

  final int? number;
  final String? en;

  factory GregorianMonth.fromJson(Map<String, dynamic> json) {
    return GregorianMonth(
      number: json["number"],
      en: json["en"],
    );
  }
}

class GregorianWeekday {
  GregorianWeekday({
    required this.en,
  });

  final String? en;

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) {
    return GregorianWeekday(
      en: json["en"],
    );
  }
}

class Hijri {
  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  final String date;
  final String format;
  final String day;
  final HijriWeekday weekday;
  final HijriMonth month;
  final String year;
  final Designation designation;
  final List<String> holidays;

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json["date"],
      format: json["format"],
      day: json["day"],
      weekday: json["weekday"],
      month: json["month"],
      year: json["year"],
      designation: json["designation"],
      holidays: json["holidays"] == null ? [] : List<String>.from(json["holidays"]!.map((x) => x)),
    );
  }
}

class HijriMonth {
  HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
  });

  final int number;
  final String en;
  final String ar;

  factory HijriMonth.fromJson(Map<String, dynamic> json) {
    return HijriMonth(
      number: json["number"],
      en: json["en"],
      ar: json["ar"],
    );
  }
}

class HijriWeekday {
  HijriWeekday({
    required this.en,
    required this.ar,
  });

  final String en;
  final String ar;

  factory HijriWeekday.fromJson(Map<String, dynamic> json) {
    return HijriWeekday(
      en: json["en"],
      ar: json["ar"],
    );
  }
}

class Meta {
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

  final double latitude;
  final double longitude;
  final String timezone;
  final Method method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Map<String, int> offset;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      latitude: json["latitude"],
      longitude: json["longitude"],
      timezone: json["timezone"],
      method: json["method"],
      latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
      midnightMode: json["midnightMode"],
      school: json["school"],
      offset: Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
    );
  }
}

class Method {
  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  final int id;
  final String name;
  final Params params;
  final Location location;

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      id: json["id"],
      name: json["name"],
      params: json["params"],
      location: json["location"],
    );
  }
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }
}

class Params {
  Params({
    required this.fajr,
    required this.isha,
  });

  final double fajr;
  final double isha;

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      fajr: json["Fajr"],
      isha: json["Isha"],
    );
  }
}

class Timings {
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

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
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
  }
}
