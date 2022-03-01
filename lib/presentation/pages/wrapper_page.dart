import 'package:eapp1/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: AppRepository().getIsFirstBootstrap() ? WelcomePage() : const HomePage(),
    // );
    return const Scaffold(
      body: HomePage(),
    );
  }

}
