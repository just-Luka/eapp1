import 'package:eapp1/domain/cubit/language_cubit.dart';
import 'package:eapp1/presentation/pages/welcome/intro_1.dart';
import 'package:eapp1/presentation/pages/welcome/intro_2.dart';
import 'package:eapp1/presentation/pages/welcome/intro_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class WelcomePage extends StatelessWidget {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        BlocProvider(
          create: (BuildContext context) => LanguageCubit(),
          child: PageView(
            controller: _controller,
            children: const [
              Intro1(),
              Intro2(),
              Intro3(),
            ],
          ),
        ),
        Positioned(
          left: width*0.41,
          top: height*0.85,
          child: Column(
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.white.withOpacity(0.5),
                  activeDotColor: const Color.fromRGBO(56, 182, 255, 1),
                  spacing: 10,
                  radius:  4.0,


                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
