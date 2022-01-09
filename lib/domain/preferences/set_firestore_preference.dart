import 'dart:convert';

import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/data/models/firestore/i_model_json_convert.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';

class SetFirestorePreference<T extends IModelJsonConvert> {
  Future<void> setModel(List<T> model, SPKeyword key) async{
    final List<String> modelJson = [];

    for (var e in model) {
      modelJson.add(jsonEncode(e.toMap()));
    }

    await SharedPreferenceFacade.setStringList(key.toString(), modelJson);
  }
}