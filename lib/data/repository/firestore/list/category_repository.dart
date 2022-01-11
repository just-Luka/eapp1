import 'dart:convert';

import 'package:eapp1/data/datasource/local/preferences/get_firestore_preference.dart';
import 'package:eapp1/data/datasource/remote/firestore/category_firestore.dart';
import 'package:eapp1/data/models/firestore/category_model.dart';
import 'package:eapp1/data/repository/firestore/list/base_firestore_list_repository.dart';

class CategoryRepository extends BaseFirestoreListRepository<CategoryModel>{
  CategoryRepository() : super(myFirestore: CategoryFirestore());

  @override
  Future<List<CategoryModel>> cloud() async{
    var cloudData = await myFirestore.docCollection();

    cloudData.forEach((e) {
      CategoryModel model = CategoryModel.encapsulate(id: e.get('id'), name: e.get('name'), sort: e.get('sort'));
      data.add(model);
    });


    return data;
  }

  @override
  List<CategoryModel> cache() {
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