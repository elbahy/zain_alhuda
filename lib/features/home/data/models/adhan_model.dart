class AdhanModel {
  AdhanModel({
    required this.code,
    required this.status,
    required this.data,
  });

  final int code;
  final String status;
  final Data data;

  factory AdhanModel.fromJson(Map<String, dynamic> json) {
    return AdhanModel(
      code: json["code"] ?? 0,
      status: json["status"] ?? '',
      data: Data.fromJson(json["data"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.timings,
    required this.date,
    required this.meta,
  });

  final Timings timings;
  final Date date;
  final Meta meta;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      timings: Timings.fromJson(json["timings"] ?? {}),
      date: Date.fromJson(json["date"] ?? {}),
      meta: Meta.fromJson(json["meta"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "timings": timings.toJson(),
        "date": date.toJson(),
        "meta": meta.toJson(),
      };
}

class Date {
  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  final String readable;
  final String timestamp;
  final Hijri hijri;
  final Gregorian gregorian;

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      readable: json["readable"] ?? '',
      timestamp: json["timestamp"] ?? '',
      hijri: Hijri.fromJson(json["hijri"] ?? {}),
      gregorian: Gregorian.fromJson(json["gregorian"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "readable": readable,
        "timestamp": timestamp,
        "hijri": hijri.toJson(),
        "gregorian": gregorian.toJson(),
      };
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
      date: json["date"] ?? '',
      format: json["format"] ?? '',
      day: json["day"] ?? '',
      weekday: GregorianWeekday.fromJson(json["weekday"] ?? {}),
      month: GregorianMonth.fromJson(json["month"] ?? {}),
      year: json["year"] ?? '',
      designation: Designation.fromJson(json["designation"] ?? {}),
    );
  }

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
  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  final String abbreviated;
  final String expanded;

  factory Designation.fromJson(Map<String, dynamic> json) {
    return Designation(
      abbreviated: json["abbreviated"] ?? '',
      expanded: json["expanded"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "abbreviated": abbreviated,
        "expanded": expanded,
      };
}

class GregorianMonth {
  GregorianMonth({
    required this.number,
    required this.en,
  });

  final int number;
  final String en;

  factory GregorianMonth.fromJson(Map<String, dynamic> json) {
    return GregorianMonth(
      number: json["number"] ?? 0,
      en: json["en"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
      };
}

class GregorianWeekday {
  GregorianWeekday({
    required this.en,
  });

  final String en;

  factory GregorianWeekday.fromJson(Map<String, dynamic> json) {
    return GregorianWeekday(
      en: json["en"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "en": en,
      };
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
  final List<dynamic> holidays;

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json["date"] ?? '',
      format: json["format"] ?? '',
      day: json["day"] ?? '',
      weekday: HijriWeekday.fromJson(json["weekday"] ?? {}),
      month: HijriMonth.fromJson(json["month"] ?? {}),
      year: json["year"] ?? '',
      designation: Designation.fromJson(json["designation"] ?? {}),
      holidays: json["holidays"] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday.toJson(),
        "month": month.toJson(),
        "year": year,
        "designation": designation.toJson(),
        "holidays": holidays,
      };
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
      number: json["number"] ?? 0,
      en: json["en"] ?? '',
      ar: json["ar"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
        "ar": ar,
      };
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
      en: json["en"] ?? '',
      ar: json["ar"] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
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
      latitude: json["latitude"] ?? 0.0,
      longitude: json["longitude"] ?? 0.0,
      timezone: json["timezone"] ?? '',
      method: Method.fromJson(json["method"] ?? {}),
      latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"] ?? '',
      midnightMode: json["midnightMode"] ?? '',
      school: json["school"] ?? '',
      offset: Map<String, int>.from(json["offset"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "method": method.toJson(),
        "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
        "midnightMode": midnightMode,
        "school": school,
        "offset": offset,
      };
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
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
      params: Params.fromJson(json["params"] ?? {}),
      location: Location.fromJson(json["location"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "params": params.toJson(),
        "location": location.toJson(),
      };
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
      latitude: json["latitude"] ?? 0.0,
      longitude: json["longitude"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
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
      fajr: json["Fajr"] ?? 0.0,
      isha: json["Isha"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Isha": isha,
      };
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
      fajr: json["Fajr"] ?? '',
      sunrise: json["Sunrise"] ?? '',
      dhuhr: json["Dhuhr"] ?? '',
      asr: json["Asr"] ?? '',
      sunset: json["Sunset"] ?? '',
      maghrib: json["Maghrib"] ?? '',
      isha: json["Isha"] ?? '',
      imsak: json["Imsak"] ?? '',
      midnight: json["Midnight"] ?? '',
      firstthird: json["Firstthird"] ?? '',
      lastthird: json["Lastthird"] ?? '',
    );
  }

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
