import 'package:flutter/cupertino.dart';

class Intro3 extends StatelessWidget {
  const Intro3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/intro3.png',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
