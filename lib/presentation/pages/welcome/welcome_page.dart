import 'package:eapp1/domain/cubit/language_cubit.dart';
import 'package:eapp1/presentation/pages/welcome/intro_1.dart';
import 'package:eapp1/presentation/pages/welcome/intro_2.dart';
import 'package:eapp1/presentation/pages/welcome/intro_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocProvider(
          create: (BuildContext context) => LanguageCubit(),
          child: PageView(
            children: const [
              Intro1(),
              Intro2(),
              Intro3(),
            ],
          ),
        ),
        // Column(
        //   children: [
        //     Row(
        //       children: [
        //         Container(
        //           width: 60,
        //           height: 20,
        //           decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: Color(0xffcecccc)),
        //         )
        //       ],
        //     ),
        //     RichText(
        //       text: TextSpan(
        //         children: [
        //           TextSpan(
        //             text: "Skip",
        //           ),
        //           WidgetSpan(
        //             child: Icon(Icons.arrow_right_alt, size: 14),
        //           ),
        //         ]
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
