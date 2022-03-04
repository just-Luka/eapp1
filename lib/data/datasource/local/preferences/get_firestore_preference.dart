import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';

class GetFirestorePreference {
  List<String>? getCategory() {
    return SharedPreferenceFacade.getStringList(SPKeyword.category.toString());
  }

  List<String>? getHotel() {
    return SharedPreferenceFacade.getStringList(SPKeyword.hotel.toString());
  }

  List<String>? getSlider() {
    return SharedPreferenceFacade.getStringList(SPKeyword.slider.toString());
  }
}