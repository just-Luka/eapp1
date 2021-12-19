import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceFacade {
  static late SharedPreferences _preferences;
  static late String keyword;

  static Future init() async{
    _preferences = await SharedPreferences.getInstance();
  }

  static void setKeyword(key) {
    keyword = key;
  }

  static Future<void> setString(String value) async{
    await _preferences.setString(keyword, value);
  }

  static String? getString() {
    return _preferences.getString(keyword);
  }
}