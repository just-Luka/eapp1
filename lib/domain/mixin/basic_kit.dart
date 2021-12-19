import 'package:eapp1/config/app_config.dart';

/// If it'll become "GOD" object, separate methods
/// in different classes
mixin BasicKit {
  final AppConfig config = AppConfig();

  getSafeConfig(value, defaultValue) {
    return value ?? defaultValue;
  }

  bool isLocaleExist(String locale) {
    for(int i=0; i<config.locales.length; i++) {
      if (config.locales[i].languageCode == locale.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

}