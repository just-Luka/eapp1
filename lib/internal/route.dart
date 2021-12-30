import 'package:eapp1/presentation/pages/wrapper_page.dart';
import 'package:flutter/material.dart';

class Route {
  static Map<String, WidgetBuilder> show(BuildContext context) {
    return {
      '/': (context) => const WrapperPage()
    };
  }
}