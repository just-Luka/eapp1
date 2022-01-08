import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';

class GetFirestorePreference {
  List<String>? getCategory () {
    return SharedPreferenceFacade.getStringList(SPKeyword.category.toString());
  }
}