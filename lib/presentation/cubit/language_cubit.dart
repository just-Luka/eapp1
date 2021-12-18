import 'package:bloc/bloc.dart';
import 'package:eapp1/config/app_config.dart';
import 'package:eapp1/data/api/locale/preferences/config_preference.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  AppConfig appConfig = AppConfig();

  LanguageCubit() : super(LanguageInitial());

  Future<void> setLanguage(String lang) async{
    emit(LanguageChecking());
    for (int i=0; i < appConfig.locales.length; i++) {
      if(appConfig.locales[i].languageCode == lang){ // If user's selected language is available in App
        await ConfigPreference().setLocale(lang);

        emit(LanguageLoading());
      }else {
        emit(LanguageErrorOccurred());
      }
    }
  }
}