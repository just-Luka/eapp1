import 'dart:convert';

import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/data/datasource/local/preferences/get_firestore_preference.dart';
import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';
import 'package:eapp1/data/datasource/remote/firestore/category_firestore.dart';
import 'package:eapp1/data/models/firestore/category_model.dart';
import 'package:eapp1/data/repository/app_repository.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:eapp1/domain/preferences/set_app_preference.dart';
import 'package:eapp1/domain/preferences/set_firestore_preference.dart';

class CategoryRepository with BasicKit {
  BaseFirestore myFirestore = CategoryFirestore();

  Future<List<CategoryModel>> byDefault() async{
    if(await isDeviceOnline()) {
      if(AppRepository().getIsFirstSetup() /* || Refresh*/) {
        List<CategoryModel> dataCloud = await cloud();
        await SetFirestorePreference<CategoryModel>().setModel(dataCloud, SPKeyword.category);
        await SetAppPreference().setFirstSetup(false);

        return dataCloud;
      }

      return cache();
    }else{
      List<CategoryModel> dataCache = cache();

      if(dataCache.isNotEmpty) {
        return dataCache;
      }
      return [];
    }
  }

  Future<List<CategoryModel>> cloud() async{
    final List<CategoryModel> data = [];

    // TODO try {} catch()
    var cloudData = await myFirestore.docCollection();

    cloudData.forEach((e) {
      CategoryModel model = CategoryModel.encapsulate(id: e.get('id'), name: e.get('name'), sort: e.get('sort'));
      data.add(model);
    });


    return data;
  }

  List<CategoryModel> cache() {
    final List<CategoryModel> data = [];

    List<String>? cacheData = GetFirestorePreference().getCategory();

    if(cacheData == null) {
      return [];
    }

    for (var e in cacheData) {
      data.add(CategoryModel().fromMap(jsonDecode(e)));
    }

    return data;
  }

}