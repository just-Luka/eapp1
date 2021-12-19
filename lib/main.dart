import 'package:eapp1/internal/application.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceFacade.init();

  runApp(Application());
}