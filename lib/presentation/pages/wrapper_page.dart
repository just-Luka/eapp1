import 'package:eapp1/presentation/pages/home/home_page.dart';
import 'package:eapp1/presentation/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

class WrapperPage extends StatelessWidget {
  final bool isFirstBootstrap = true;

  const WrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isFirstBootstrap ? const WelcomePage() : const HomePage(),
    );
  }

}
