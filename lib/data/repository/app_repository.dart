import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/data/datasource/local/preferences/app_preference.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';

class AppRepository with BasicKit{
  String getLocale() {
    String appLocale = AppConfig.locale;
    String? userLocale = AppPreference().getLocale();

    return userLocale ?? appLocale;
  }

  // bool getTheme(bool isLightMode);
}