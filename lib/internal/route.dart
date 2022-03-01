import 'package:eapp1/presentation/pages/wrapper_page.dart';
import 'package:flutter/material.dart';

class Route {
  static Map<String, WidgetBuilder> call(BuildContext context) {
    return {
      '/': (_) => const WrapperPage(),
    };
  }
}