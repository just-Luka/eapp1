import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';

class GetAppPreference {
  String? getLocale() {
    return SharedPreferenceFacade.getString(SPKeyword.locale.toString());
  }

  bool? getIsFirstBootstrap() {
    return SharedPreferenceFacade.getBool(
        SPKeyword.isFirstBootstrap.toString());
  }

  bool? getTheme() {
    return SharedPreferenceFacade.getBool(SPKeyword.theme.toString());
  }
}
