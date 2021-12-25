import 'package:eapp1/domain/mixin/basic_kit.dart';

/// WelcomeTranslate uses when application was downloaded
/// and opened first time, it keeps translations of
/// Welcome page and helps provide localized text
/// in real time, [ ~ Why I don't use l10n instead of that ]
/// > answer is "performance" in case of l10n I have to change
/// whole app's language and in this case I need to localize only Welcome page
class WelcomeTranslate with BasicKit{
  /// EN, KA, RU ...
  final String locale;

  WelcomeTranslate({
    required this.locale
  });


  Map<String, String> value() {
    if(!isLocaleExist(locale)) {
      return {'error': 'That locale in app does not exist!'};
    }

    switch (locale.toLowerCase()){
      case 'en':
        return {
          'title1': 'Welcome',
          'introSubText1': 'Please choose your language before continue',
          'title2': 'Lorem Ipsum Dolor',
          'introSubText2': 'Georgia is one of the\nbeautiful\nand ancient country in the world',
        };
      case 'ka':
        return {
          'title1': 'გამარჯობა',
          'introSubText1': 'აირჩიეთ თქვენთვის სასურველი ენა',
          'title2': 'ლორემ იპსუმ დოლორ',
          'introSubText2': 'KA_Georgia is one of the\nbeautiful\nand ancient country in the world',
        };
      case 'ru':
        return {
          'title1': 'Здравствуйте',
          'introSubText1': 'Выберите предпочитаемый язык',
          'title2': 'RU_Lorem Ipsum Dolor',
          'introSubText2': 'RU_Georgia is one of the\nbeautiful\nand ancient country in the world',
        };
      default:
        return {'error': 'Translation is not available for this language!'};
    }
  }
}