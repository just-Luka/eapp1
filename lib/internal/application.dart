import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:eapp1/presentation/cubit/language_cubit.dart';
import 'package:eapp1/presentation/pages/wrapper_page.dart';
import 'package:eapp1/presentation/styles/themes/dark_theme.dart';
import 'package:eapp1/presentation/styles/themes/i_theme.dart';
import 'package:eapp1/presentation/styles/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Application extends StatelessWidget with BasicKit{
  AppConfig appConfig = AppConfig();

  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (BuildContext context) => LanguageCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Meet Tbilisi',
        theme: theme(isLightMode() ? LightTheme() : DarkTheme()),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: appConfig.locales,
        localeResolutionCallback: (locales, supportedLocales) => Locale(getSafeConfig(null, appConfig.locale)),
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        // supportedLocales: AppLocalizations.supportedLocales,
        home: WrapperPage(),
      ),
    );
  }

  ThemeData theme(ITheme theme){
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: theme.appbarColor,
      ),
    );
  }

  bool isLightMode() {
    // if (USER SET THEME BY HIMSELF) return USER'S THEME COLOR
    return appConfig.lightMode;
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)!.helloWorld),
    );
  }
}

