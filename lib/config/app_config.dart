import 'package:flutter/cupertino.dart';

class AppConfig {

  /// Switch darkMode/lightMode
  static const bool lightMode = true;

  /// Default language
  static const String locale = 'ka';

  /// Here you can add language support for app
  static const List<Locale> locales = [
    Locale('ka', ''),
    Locale('en', ''),
    Locale('ru', ''),
    // Locale('fr', ''),
  ];
}