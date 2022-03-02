import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/data/repository/app_repository.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:eapp1/internal/dependency/app_theme.dart';
import 'package:eapp1/internal/route.dart' as internal;
import 'package:eapp1/presentation/styles/themes/dark_theme.dart';
import 'package:eapp1/presentation/styles/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Application extends StatelessWidget with BasicKit {
  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme();
    final appRoutes = internal.Route();

    return MaterialApp(
      title: 'Welcome to Tbilisi',
      theme: appTheme(isLightMode() ? LightTheme() : DarkTheme()),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppConfig.locales,
      locale: Locale(AppRepository().getLocale()),
      initialRoute: '/',
      routes: appRoutes(context),
    );
  }

  bool isLightMode() {
    // if (USER SET THEME BY HIMSELF) return USER'S THEME COLOR
    return AppConfig.lightMode;
  }
}