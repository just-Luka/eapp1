import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceFacade {
  static late SharedPreferences _preferences;

  static Future init() async{
    _preferences = await SharedPreferences.getInstance();
  }

  static void clear() {
    _preferences.clear();
  }

  static Future<void> setString(keyword, String value) async{
    await _preferences.setString(keyword, value);
  }

  static String? getString(keyword) {
    return _preferences.getString(keyword);
  }
}