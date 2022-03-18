import 'package:eapp1/domain/cubit/firestore/category_cubit.dart';
import 'package:eapp1/domain/cubit/firestore/slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageReload {
  const PageReload();

  Future<void> homePage(BuildContext context) async {
    await BlocProvider.of<CategoryCubit>(context).fetchCategory(true);
    await BlocProvider.of<SliderCubit>(context).fetchSlider(true);
  }
}
