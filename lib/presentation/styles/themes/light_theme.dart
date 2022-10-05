import 'package:eapp1/presentation/styles/themes/i_theme.dart';
import 'package:flutter/material.dart';

class LightTheme implements ITheme {
  @override
  Color scaffoldBackgroundColor = const Color.fromRGBO(245, 245, 245, 1.0);

  @override
  Color appbarColor = const Color.fromRGBO(245, 245, 245, 1.0);

  @override
  Color bottomNavSelectedItemColor = Colors.blue[500]!;

  @override
  Color bottomNavUnselectedItemColor = Colors.grey;

  @override
  Color bottomNavBackgroundColor = Colors.white;

  @override
  Color bottomNavUnselectedColor = Colors.grey;

  @override
  Color primaryTitleLargeColor = Colors.black;

  @override
  Color primaryTitleMediumColor = Colors.grey;

  @override
  Color cardBackgroundColor = Colors.white;

  @override
  Color cardIconColor = Colors.grey;

  @override
  Color chipBackgroundColor = const Color.fromRGBO(232, 232, 232, 1.0);

  @override
  Color chipSelectedColor = const Color.fromRGBO(0, 102, 255, 1.0);

  @override
  Color chipSecondarySelectedColor = const Color.fromRGBO(177, 208, 253, 1.0);
}
