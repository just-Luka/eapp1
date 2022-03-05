import 'dart:convert';

import 'package:eapp1/data/datasource/local/preferences/get_firestore_preference.dart';
import 'package:eapp1/data/datasource/remote/firestore/slider_firestore.dart';
import 'package:eapp1/data/models/firestore/slider_model.dart';
import 'package:eapp1/data/repository/firestore/list/base_firestore_list_repository.dart';

class SliderRepository extends BaseFirestoreListRepository<SliderModel> {
  SliderRepository() : super(myFirestore: SliderFirestore());

  @override
  Future<List<SliderModel>> cloud() async{
    var cloudData = await myFirestore.docCollection();

    cloudData.forEach((e) {
      SliderModel model = SliderModel.encapsulate(id: e.get("id"), hotelId: e.get("hotel_id"), sort: e.get("sort"));

      data.add(model);
    });

    return data;
  }

  @override
  List<SliderModel> cache() {
    List<String>? cacheData = GetFirestorePreference().getSlider();

    if(cacheData == null) {
      return [];
    }

    for (var e in cacheData) {
      data.add(SliderModel().fromMap(jsonDecode(e)));
    }

    return data;
  }
}