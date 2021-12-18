part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageChecking extends LanguageState {}

class LanguageLoading extends LanguageState {}

class LanguageErrorOccurred extends LanguageState {}