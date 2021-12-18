import 'package:eapp1/presentation/pages/welcome/intro_1.dart';
import 'package:eapp1/presentation/pages/welcome/intro_2.dart';
import 'package:eapp1/presentation/pages/welcome/intro_3.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: controller,
          children: [
            Intro1(),
            Intro2(),
            Intro3(),
          ],
        ),
      ],
    );
  }
}
