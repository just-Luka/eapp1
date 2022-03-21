import 'package:eapp1/data/repository/app_repository.dart';
import 'package:eapp1/domain/preferences/set_app_preference.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool lightTheme = AppRepository().getTheme();

  void switchTheme() {
    lightTheme = !lightTheme;
    SetAppPreference().setTheme(lightTheme);
    notifyListeners();
  }
}
