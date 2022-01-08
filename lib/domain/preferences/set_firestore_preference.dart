import 'dart:convert';

import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/data/models/category_model.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';

class SetFirestorePreference {
  Future<void> setCategory(List<CategoryModel> category) async {
    List<String> modelJson = [];

    for (var e in category) {
      modelJson.add(jsonEncode(e.toMap()));
    }

    await SharedPreferenceFacade.setStringList(SPKeyword.category.toString(), modelJson);
  }
}