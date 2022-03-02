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
      ),
    );
  }
}