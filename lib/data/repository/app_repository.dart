import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/data/datasource/local/preferences/get_app_preference.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';

class AppRepository with BasicKit {
  String getLocale() {
    String appLocale = AppConfig.locale;
    String? userLocale = GetAppPreference().getLocale();

    return userLocale ?? appLocale;
  }

  bool getIsFirstBootstrap() {
    return GetAppPreference().getIsFirstBootstrap() ?? true;
  }

  bool getTheme() {
    bool appTheme = AppConfig.lightMode;
    bool? userTheme = GetAppPreference().getTheme();

    return userTheme ?? appTheme;
  }
}
