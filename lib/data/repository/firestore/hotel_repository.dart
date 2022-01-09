import 'dart:convert';

import 'package:eapp1/data/datasource/local/preferences/get_firestore_preference.dart';
import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';
import 'package:eapp1/data/datasource/remote/firestore/hotel_firestore.dart';
import 'package:eapp1/data/models/firestore/hotel_model.dart';

class HotelRepository {
  BaseFirestore myFirestore = HotelFirestore();

  Future<List<HotelModel>> cloud() async{
    final List<HotelModel> data = [];

    var cloudData = await myFirestore.docCollection();

    cloudData.forEach((e) {
      HotelModel model = HotelModel.encapsulate(id: e.get('id'), name: e.get('name'), per: e.get('per'), location: e.get('location'), star: e.get('star'));
      data.add(model);
    });

    return data;
  }

  List<HotelModel> cache() {
    final List<HotelModel> data = [];

    List<String>? cacheData = GetFirestorePreference().getHotel();

    if(cacheData == null) {
      return [];
    }

    for (var e in cacheData) {
      data.add(HotelModel().fromMap(jsonDecode(e)));
    }

    return data;
  }
}