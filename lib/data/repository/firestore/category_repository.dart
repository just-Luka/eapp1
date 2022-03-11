import 'dart:convert';

import 'package:eapp1/data/datasource/local/preferences/get_firestore_preference.dart';
import 'package:eapp1/data/datasource/remote/firestore/category_firestore.dart';
import 'package:eapp1/data/models/firestore/category_model.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:eapp1/domain/preferences/set_firestore_preference.dart';

class CategoryRepository with BasicKit {
  final List<CategoryModel> data = [];
  final CategoryFirestore _firestore = const CategoryFirestore();

  Future<List<CategoryModel>> cloud() async {
    var cloudData = await _firestore.getCollection();

    cloudData.forEach((e) {
      CategoryModel model = CategoryModel(
        id: e.get('id'),
        name: e.get('name'),
        sort: e.get('sort'),
      );
      data.add(model);
    });

    return data;
  }

  List<CategoryModel> cache() {
    List<String>? cacheData = GetFirestorePreference().getCategory();

    if (cacheData == null) {
      return [];
    }

    for (var e in cacheData) {
      data.add(CategoryModel.fromMap(jsonDecode(e)));
    }

    return data;
  }

  Future<List<CategoryModel>> getData(bool isReloaded,
      {reChecked = false}) async {
    if (await isDeviceOnline() && isReloaded) {
      List<CategoryModel> dataCloud = await cloud();
      await SetFirestorePreference().setCategory(dataCloud);

      return dataCloud;
    } else {
      List<CategoryModel> dataCache = cache();

      if (dataCache.isNotEmpty) {
        return dataCache;
      }

      if (!reChecked) {
        return getData(true, reChecked: true);
      }

      return [];
    }
  }
}
