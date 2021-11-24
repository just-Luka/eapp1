import 'package:flutter/cupertino.dart';

class AppConfig {

  /// Switch darkMode/lightMode
  final bool lightMode = true;

  /// Default language
  final String locale = 'en';

  /// Here you can add language support for app
  final List<Locale> locales = [
    Locale('en', ''),
    Locale('ka', ''),
    // Locale('ru', ''),
  ];
}