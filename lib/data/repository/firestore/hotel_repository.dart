import 'dart:convert';

import 'package:eapp1/data/datasource/local/preferences/get_firestore_preference.dart';
import 'package:eapp1/data/datasource/remote/firestore/hotel_firestore.dart';
import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:eapp1/domain/preferences/set_firestore_preference.dart';

class HotelRepository with BasicKit {
  final List<HotelModel> data = [];
  final HotelFirestore _firestore = const HotelFirestore();

  Future<List<HotelModel>> cloud() async {
    var cloudData = await _firestore.getCollection();

    cloudData.forEach((e) {
      HotelModel model = HotelModel(
        id: e.get('id'),
        name: e.get('name'),
        per: e.get('per'),
        location: e.get('location'),
        star: e.get('star'),
        price: e.get('price'),
        categoryIds: e.get("category_ids"),
        image: e.get('image'),
      );
      data.add(model);
    });

    return data;
  }

  List<HotelModel> cache() {
    List<String>? cacheData = GetFirestorePreference().getHotel();

    if (cacheData == null) {
      return [];
    }

    for (var e in cacheData) {
      data.add(HotelModel.fromMap(jsonDecode(e)));
    }

    return data;
  }

  Future<List<HotelModel>> getData(bool isReloaded, {reChecked = false}) async {
    if (await isDeviceOnline() && isReloaded) {
      List<HotelModel> dataCloud = await cloud();
      await SetFirestorePreference().setHotel(dataCloud);

      return dataCloud;
    } else {
      List<HotelModel> dataCache = cache();

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
