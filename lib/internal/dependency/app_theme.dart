import 'package:eapp1/data/repository/app_repository.dart';
import 'package:eapp1/presentation/styles/themes/i_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData call(ITheme iTheme) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: iTheme.appbarColor,
      ),
      scaffoldBackgroundColor: iTheme.scaffoldBackgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: iTheme.bottomNavSelectedItemColor,
        unselectedItemColor: iTheme.bottomNavUnselectedItemColor,
        elevation: 15,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: iTheme.bottomNavBackgroundColor,
        selectedIconTheme: const IconThemeData(
          color: Color.fromRGBO(53, 133, 255, 1.0),
        ),
        unselectedIconTheme: IconThemeData(
          color: iTheme.bottomNavUnselectedColor,
        ),
      ),
      primaryTextTheme: TextTheme(
        titleLarge: TextStyle(color: iTheme.primaryTitleLargeColor),
        titleMedium: TextStyle(color: iTheme.primaryTitleMediumColor),
      ),
      chipTheme: ChipThemeData(
        selectedColor: iTheme.chipSelectedColor,
        backgroundColor: iTheme.chipBackgroundColor,
        secondarySelectedColor: iTheme.chipSecondarySelectedColor,
      ),
      iconTheme: IconThemeData(color: iTheme.cardIconColor),
      cardColor: iTheme.cardBackgroundColor,
    );
  }
}

extension NewThemeData on ThemeData {
  static bool get _isLight => AppRepository().getTheme();

  Color get darkModeIcon =>
      _isLight ? Colors.white : const Color.fromARGB(255, 13, 0, 49);
  Color get darkModeBackground =>
      _isLight ? const Color.fromARGB(255, 13, 0, 49) : Colors.white;

  Color get hotelCardBackgroundColor =>
      _isLight ? Colors.white : Color.fromARGB(204, 211, 211, 211);
}
