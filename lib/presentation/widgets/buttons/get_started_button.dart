import 'package:eapp1/data/datasource/local/translates/welcome_translate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedButton extends StatelessWidget {
  final String locale;

  const GetStartedButton({
    Key? key,
    required this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 50,
      margin: const EdgeInsets.only(top: 140, left: 150),
      color: const Color.fromRGBO(56, 182, 255, 1),
      child: Center(
        child: Text(
          WelcomeTranslate(locale: locale).value()['next'] ?? '',
          style: responsiveStyle(),
        ),
      ),
    );
  }

  TextStyle responsiveStyle(){
    switch (locale) {
      case 'en':
        return GoogleFonts.archivo(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 3,
        );
      case 'ka':
        return GoogleFonts.archivo(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
      case 'ru':
        return GoogleFonts.archivo(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 3,
        );
      default:
        return GoogleFonts.archivo(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 3,
        );
    }
  }
}
