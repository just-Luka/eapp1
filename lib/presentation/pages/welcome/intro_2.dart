import 'package:eapp1/data/datasource/local/translates/welcome_translate.dart';
import 'package:eapp1/data/repository/app_repository.dart';
import 'package:eapp1/presentation/widgets/cubits/welcome_cubit_widget.dart';
import 'package:eapp1/presentation/widgets/frames/full_screen_portrait_image_frame.dart';
import 'package:eapp1/presentation/widgets/welcome/intro_center_block.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro2 extends StatelessWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children : [
        const FullScreenPortraitImageFrame(image: 'assets/images/Optimized-intro2.png'),
        IntroCenterBlock(
          child: Column(
            children: [
              WelcomeCubitWidget(
                checkingChild: const SizedBox(),
                updatedChild: (lang) => Column(
                  children: [
                    const SizedBox(height: 90),
                    Text(
                      WelcomeTranslate(locale: lang).value()['title2'] ?? '',
                      style: GoogleFonts.archivo(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.4,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        WelcomeTranslate(locale: lang).value()['introSubText2'] ?? '',
                        style: GoogleFonts.archivo(
                            fontSize: 23,
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            height: 1.5
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                defaultChild: Column(
                  children: [
                    const SizedBox(height: 90),
                    Text(
                      WelcomeTranslate(locale: AppRepository().getLocale()).value()['title2'] ?? '',
                      style: GoogleFonts.archivo(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.4,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        WelcomeTranslate(locale: AppRepository().getLocale()).value()['introSubText2'] ?? '',
                        style: GoogleFonts.archivo(
                            fontSize: 23,
                            color: const Color.fromRGBO(217, 217, 217, 1),
                            height: 1.5
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
