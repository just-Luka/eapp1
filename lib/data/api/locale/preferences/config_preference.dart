import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/data/api/locale/preferences/base_preference.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';

class ConfigPreference extends BasePreference{

  Future<void> setLocale(String lang) async{
    SharedPreferenceFacade.setKeyword('lang');
    await SharedPreferenceFacade.setString(lang);
  }

  String getLocale() {
    SharedPreferenceFacade.setKeyword('lang');
    return SharedPreferenceFacade.getString() ?? AppConfig().locale;
  }
}