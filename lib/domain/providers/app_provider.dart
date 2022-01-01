import 'package:eapp1/data/repository/app_repository.dart';
import 'package:flutter/foundation.dart';

class AppProvider with ChangeNotifier{
  String? locale;

  //TODO locale update
  Future<void> refreshTree() async{
    // String currentLocale = AppRepository().getLocale();
    // locale = currentLocale;
    //
    // notifyListeners();
  }
}