import 'package:eapp1/presentation/styles/themes/i_theme.dart';
import 'package:flutter/material.dart';

class DarkTheme implements ITheme {
  @override
  Color scaffoldBackgroundColor = const Color.fromARGB(204, 46, 44, 44);

  @override
  Color appbarColor = const Color.fromARGB(204, 46, 44, 44);

  @override
  Color bottomNavSelectedItemColor = const Color.fromARGB(255, 243, 33, 33);

  @override
  Color bottomNavUnselectedItemColor = const Color.fromARGB(204, 46, 44, 44);

  @override
  Color bottomNavBackgroundColor = const Color.fromARGB(204, 46, 44, 44);

  @override
  Color bottomNavUnselectedColor = Colors.white;

  @override
  Color primaryTitleLargeColor = Colors.white;

  @override
  Color primaryTitleMediumColor = Colors.grey;

  @override
  Color cardBackgroundColor = const Color.fromARGB(204, 58, 55, 55);

  @override
  Color cardIconColor = Colors.white;
}
