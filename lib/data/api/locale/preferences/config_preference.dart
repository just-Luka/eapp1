import 'package:eapp1/data/api/locale/preferences/base_preference.dart';

class ConfigPreference extends BasePreference{
  Future<void> setLocale(String lang) async {
    await storage.setString('locale', lang);
  }

  String? getLocale() => storage.getString('locale');
}