import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/data/repository/app_repository.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:eapp1/domain/providers/app_provider.dart';
import 'package:eapp1/internal/dependency/app_theme.dart';
import 'package:eapp1/internal/route.dart' as internal;
import 'package:eapp1/presentation/styles/themes/dark_theme.dart';
import 'package:eapp1/presentation/styles/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget with BasicKit {
  final AppTheme appTheme = AppTheme();
  final appRoutes = internal.Route();

  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (_) => AppProvider(),
      child: Builder(
        builder: (context) {
          final lightTheme = context.watch<AppProvider>().lightTheme;

          return MaterialApp(
            title: 'Welcome to Tbilisi',
            theme: appTheme(lightTheme ? LightTheme() : DarkTheme()),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
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
        },
      ),
    );
  }
}
