import 'package:bloc/bloc.dart';
import 'package:eapp1/data/datasource/local/preferences/app_preference.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> with BasicKit{
  LanguageCubit() : super(LanguageInitial());

  Future<void> setLanguage(String lang) async{
    emit(LanguageChecking());
    if(isLocaleExist(lang)) {
      await AppPreference().setLocale(lang);
      emit(LanguageUpdated(currentLang: lang));
    }else {
      emit(LanguageErrorOccurred());
    }
  }
}