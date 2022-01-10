import 'dart:convert';

import 'package:eapp1/data/datasource/local/preferences/get_firestore_preference.dart';
import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';
import 'package:eapp1/data/datasource/remote/firestore/category_firestore.dart';
import 'package:eapp1/data/models/firestore/category_model.dart';
import 'package:eapp1/data/repository/firestore/list/i_firestore_list_repository.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';

class CategoryRepository with BasicKit implements IFirestoreListRepository<CategoryModel>{
  BaseFirestore myFirestore = CategoryFirestore();

  @override
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

  @override
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