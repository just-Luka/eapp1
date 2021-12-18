import 'package:shared_preferences/shared_preferences.dart';

abstract class BasePreference {
  late SharedPreferences storage;

  // TODO move that file to Facade, Refactor as basic class and implement functions getString, setString, etc...

  Future init() async => storage = await SharedPreferences.getInstance();

}