import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';

class SetAppPreference {
  Future<void> setLocale(String lang) async{
    await SharedPreferenceFacade.setString(SPKeyword.locale.toString(), lang);
  }

  Future<void> setFirstBootstrap() async{
    await SharedPreferenceFacade.setBool(SPKeyword.isFirstBootstrap.toString(), false);
  }

}