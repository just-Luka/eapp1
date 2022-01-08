import 'dart:convert';

import 'package:eapp1/data/datasource/local/preferences/get_firestore_preference.dart';
import 'package:eapp1/data/datasource/remote/firestore/category_firestore.dart';
import 'package:eapp1/data/models/category_model.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:eapp1/domain/preferences/set_firestore_preference.dart';

class CategoryRepository with BasicKit {
  List<CategoryModel> data = [];

  Future<List<CategoryModel>> safeCategoryList() async {
    if(await isDeviceOnline()) {
      List<CategoryModel> cloudData = await cloudCategoryList();
      // TODO refactoring, OOP
      SetFirestorePreference().setCategory(cloudData);
      return cloudData;
    }else{
      return cacheCategoryList();
    }
  }

  Future<List<CategoryModel>> cloudCategoryList() async{
    var cloudData = await CategoryFirestore().dataList();

    cloudData.forEach((e) {
      CategoryModel model = CategoryModel(id: e.get('id'), name: e.get('name'), sort: e.get('sort'));
      data.add(model);
    });


    return data;
  }

  List<CategoryModel> cacheCategoryList() {
    List<String> cacheData = GetFirestorePreference().getCategory() ?? [];
    print(cacheData);
    if(cacheData.isEmpty) {
      return [];
    }

    for (var e in cacheData) {
      data.add(CategoryModel.fromMap(jsonDecode(e)));
    }

    return data;
  }
}