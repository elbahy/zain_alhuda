import 'dart:convert';

import 'package:flutter/services.dart';

class JsonLoad {
  Future<Map<String, dynamic>> loadJson({required String path}) async {
    String jsonString = await rootBundle.loadString(path);
    Map<String, dynamic> data = json.decode(jsonString);
    return data;
  }
}
