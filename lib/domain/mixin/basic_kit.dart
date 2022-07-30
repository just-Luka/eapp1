import 'dart:io';

import 'package:eapp1/config/app_config.dart';

/// Helper class
/// If it'll become "GOD" object, separate methods
/// in different classes
mixin BasicKit {
  bool isLocaleExist(String locale) {
    const locales = AppConfig.locales;

    for (int i = 0; i < locales.length; i++) {
      if (locales[i].languageCode == locale.toLowerCase()) {
        return true;
      }
    }
    return false;
  }

  Future<bool> isDeviceOnline() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {}
    return false;
  }
}
