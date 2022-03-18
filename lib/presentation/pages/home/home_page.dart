import 'dart:io';

import 'package:eapp1/domain/cubit/firestore/category_cubit.dart';
import 'package:eapp1/domain/cubit/firestore/slider_cubit.dart';
import 'package:eapp1/presentation/pages/home/platform/home_page_android.dart';
import 'package:eapp1/presentation/pages/home/platform/home_page_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit()..fetchCategory(false),
        ),
        BlocProvider<SliderCubit>(
          create: (context) => SliderCubit()..fetchSlider(false),
        ),
      ],
      child: Platform.isIOS ? const HomePageIos() : const HomePageAndroid(),
    );
  }
}
