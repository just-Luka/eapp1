import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/presentation/pages/welcome/intro_1.dart';
import 'package:eapp1/presentation/pages/wrapper_page.dart';
import 'package:eapp1/presentation/styles/themes/dark_theme.dart';
import 'package:eapp1/presentation/styles/themes/i_theme.dart';
import 'package:eapp1/presentation/styles/themes/light_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Application extends StatelessWidget {
  AppConfig appConfig = AppConfig();

  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(isLightMode() ? LightTheme() : DarkTheme()),
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: appConfig.locales,
      localeResolutionCallback: (locales, supportedLocales) => Locale(appConfig.locale),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      home: WrapperPage(),
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

