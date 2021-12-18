import 'package:eapp1/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro1 extends StatefulWidget {

  Intro1({Key? key}) : super(key: key);

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  int current = 1;
  final AppConfig appConfig = AppConfig();
  late PageController pageController = PageController(
    initialPage: current,
    viewportFraction: 0.4,
  );


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Image.asset(
          'assets/images/intro1.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Center(
          child: Container(
            width: width * 0.85,
            height: 700,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 90),
                Text(
                  AppLocalizations.of(context)!.introWelcome,
                  style: GoogleFonts.archivo(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(56, 182, 255, 1),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    AppLocalizations.of(context)!.introSubText1,
                    style: GoogleFonts.archivo(
                      fontSize: 23,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.5
                    ),
                  ),
                ),
                SizedBox(height: 130),
                Container(
                  width: width * 0.85,
                  height: 60,
                  // color: Colors.red,
                  child: PageView.builder(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: appConfig.locales.length,
                    onPageChanged: (int page) => updateLocale(page),
                    itemBuilder: (context, index){
                      return Center(
                        child: Text(
                          appConfig.locales[index].languageCode.toUpperCase(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: current == index ? Color.fromRGBO(56, 182, 255, 1) : Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  height: 25,
                  thickness: 10,
                  color: Colors.white,
                  indent: 130,
                  endIndent: 130,
                ),
              ],
            ),
          ),
        ),
      ]
    );
  }
  void updateLocale(int page) {
    setState(() {
      current = page;
    });
  }
}
