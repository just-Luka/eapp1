import 'package:eapp1/internal/application.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInit();
  await bootstrapMethods();

  // SharedPreferenceFacade.clear();
  runApp(Application());
}

Future<void> dependencyInit() async {
  await SharedPreferenceFacade.init();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAyjDjFvenLcqVB2OuWuK42BWde3Zdo_UM",
      appId: "1:71749572733:android:df6ac9eeba4c4462f1f914",
      messagingSenderId: "71749572733",
      projectId: "eapp-96365",
    ),
  );
}

Future<void> bootstrapMethods() async {
  // await SetAppPreference().setFirstSetup(true);
}
