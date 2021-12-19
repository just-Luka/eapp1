part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageChecking extends LanguageState {}

class LanguageUpdated extends LanguageState {
  String currentLang;

  LanguageUpdated({
    required this.currentLang,
  });
}

class LanguageErrorOccurred extends LanguageState {}