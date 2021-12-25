import 'package:eapp1/config/app_config.dart';

/// If it'll become "GOD" object, separate methods
/// in different classes
mixin BasicKit {
  bool isLocaleExist(String locale) {
    final locales = AppConfig.locales;

    for(int i=0; i<locales.length; i++) {
      if (locales[i].languageCode == locale.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

}