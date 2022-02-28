import 'package:eapp1/domain/preferences/set_app_preference.dart';
import 'package:eapp1/internal/application.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInit();
  await bootstrapMethods();

  // SharedPreferenceFacade.clear();
  runApp(Application());
}

Future<void> dependencyInit() async {
  await SharedPreferenceFacade.init();
  await Firebase.initializeApp();
}

Future<void> bootstrapMethods() async {
  // await SetAppPreference().setFirstSetup(true);
}