import 'package:eapp1/data/datasource/local/preferences/keyword.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';

class AppPreference {
  Future<void> setLocale(String lang) async{
    await SharedPreferenceFacade.setString(keyword.locale.toString(), lang);
  }

  String? getLocale() {
    return SharedPreferenceFacade.getString(keyword.locale.toString());
  }
}