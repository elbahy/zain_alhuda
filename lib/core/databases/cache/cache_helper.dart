import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData({required String key, required dynamic value}) async {
    if (value is String) {
      await _sharedPreferences!.setString(key, value);
    } else if (value is bool) {
      await _sharedPreferences!.setBool(key, value);
    } else if (value is int) {
      await _sharedPreferences!.setInt(key, value);
    } else if (value is double) {
      await _sharedPreferences!.setDouble(key, value);
    } else if (value is List<String>) {
      await _sharedPreferences!.setStringList(key, value);
    }
  }

  dynamic getData({required String key}) {
    return _sharedPreferences!.get(key);
  }
}
