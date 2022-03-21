import 'dart:async';
import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/data/datasource/local/translates/welcome_translate.dart';
import 'package:eapp1/data/repository/app_repository.dart';
import 'package:eapp1/domain/cubit/language_cubit.dart';
import 'package:eapp1/presentation/widgets/cubits/welcome_cubit_widget.dart';
import 'package:eapp1/presentation/widgets/frames/full_screen_portrait_image_frame.dart';
import 'package:eapp1/presentation/widgets/frames/intro_center_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro1 extends StatefulWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  int current = 0;
  Timer? run;

  late PageController pageController = PageController(
    initialPage: current,
    viewportFraction: 0.4,
  );

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Stack(children: [
      const FullScreenPortraitImageFrame(
          image: 'assets/images/Optimized-intro1.png'),
      IntroCenterFrame(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeCubitWidget(
              updatedChild: (lang) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  Text(
                    WelcomeTranslate(locale: lang).value()['title1'] ?? '',
                    style: GoogleFonts.archivo(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(56, 182, 255, 1),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      WelcomeTranslate(locale: lang).value()['introSubText1'] ??
                          '',
                      style: GoogleFonts.archivo(
                          fontSize: 23, color: Colors.white, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 130),
                ],
              ),
              defaultChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  Text(
                    WelcomeTranslate(locale: AppRepository().getLocale())
                            .value()['title1'] ??
                        '',
                    style: GoogleFonts.archivo(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(56, 182, 255, 1),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Text(
                      WelcomeTranslate(locale: AppRepository().getLocale())
                              .value()['introSubText1'] ??
                          '',
                      style: GoogleFonts.archivo(
                          fontSize: 23, color: Colors.white, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 130),
                ],
              ),
            ),
            SizedBox(
              width: width * 0.85,
              height: 60,
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: AppConfig.locales.length,
                onPageChanged: (int page) => {
                  run?.cancel(),
                  run = Timer(
                      const Duration(seconds: 1),
                      () => BlocProvider.of<LanguageCubit>(context)
                          .setLanguage(AppConfig.locales[page].languageCode)),
                  setState(() {
                    current = page;
                  })
                },
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      AppConfig.locales[index].languageCode.toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: current == index
                            ? const Color.fromRGBO(56, 182, 255, 1)
                            : Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(
              height: 25,
              thickness: 10,
              color: Colors.white,
              indent: 130,
              endIndent: 130,
            ),
          ],
        ),
      ),
    ]);
  }
}
