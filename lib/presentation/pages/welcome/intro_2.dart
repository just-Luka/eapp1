import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/intro2.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
