import 'package:eapp1/domain/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeCubitWidget extends StatelessWidget {
  final Widget checkingChild;
  final Function(String) updatedChild;
  final Widget defaultChild;

  const WelcomeCubitWidget({
    required this.checkingChild,
    required this.updatedChild,
    required this.defaultChild,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          if(state is LanguageUpdated) {
            return updatedChild(state.currentLang);
          }else {
            return defaultChild;
          }
        }
    );
  }
}
