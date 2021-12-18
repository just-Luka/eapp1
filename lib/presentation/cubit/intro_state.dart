part of 'intro_cubit.dart';

@immutable
abstract class IntroState {}

class IntroInitial extends IntroState {}

class IntroChecking extends IntroState {}

class IntroSettingUp extends IntroState {}

class IntroErrorOccurred extends IntroState {}