import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceFacade {
  static late SharedPreferences _preferences;

  static Future init() async{
    _preferences = await SharedPreferences.getInstance();
  }

  static void clear() {
    _preferences.clear();
  }

  static Future<void> setString(key, String value) async{
    await _preferences.setString(key, value);
  }

  static String? getString(key) {
    return _preferences.getString(key);
  }

  static Future<void> setBool(key, bool value) async{
    await _preferences.setBool(key, value);
  }

  static bool? getBool(key) {
    return _preferences.getBool(key);
  }
}