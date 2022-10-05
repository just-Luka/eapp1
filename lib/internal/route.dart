import 'package:eapp1/presentation/pages/auth/login_page.dart';
import 'package:eapp1/presentation/pages/auth/register_page.dart';
import 'package:eapp1/presentation/pages/setting/language_page.dart';
import 'package:eapp1/presentation/pages/wrapper_page.dart';
import 'package:flutter/material.dart';

class Route {
  Map<String, WidgetBuilder> call(BuildContext context) {
    return {
      '/': (_) => const WrapperPage(),
      '/login': (_) => LoginPage(),
      '/register': (_) => const RegisterPage(),
      '/change_language': (_) => const LanguagePage(),
    };
  }
}
