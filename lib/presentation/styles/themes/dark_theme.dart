import 'package:eapp1/presentation/styles/themes/i_theme.dart';
import 'package:flutter/material.dart';

class DarkTheme implements ITheme {
  @override
  Color appbarColor = const Color.fromRGBO(66, 66, 66, 0.8);

  @override
  Color bottomNavSelectedItemColor = Colors.blue[500]!;

  @override
  Color bottomNavUnselectedItemColor = Colors.grey;

  @override
  Color scaffoldBackgroundColor = const Color.fromRGBO(245, 245, 245, 1.0);
}