import 'dart:convert';

import 'package:eapp1/data/datasource/local/preferences/get_firestore_preference.dart';
import 'package:eapp1/data/datasource/remote/firestore/slider_firestore.dart';
import 'package:eapp1/data/models/firestore/slider_model.dart';
import 'package:eapp1/domain/mixin/basic_kit.dart';
import 'package:eapp1/domain/preferences/set_firestore_preference.dart';

class SliderRepository with BasicKit {
  List<SliderModel> data = [];
  final SliderFirestore _firestore = const SliderFirestore();

  Future<List<SliderModel>> cloud() async {
    var cloudData = await _firestore.getCollection();

    cloudData.forEach((e) {
      SliderModel model = SliderModel(
        id: e.get("id"),
        hotelId: e.get("hotel_id"),
        sort: e.get("sort"),
      );

      data.add(model);
    });

    return data;
  }

  List<SliderModel> cache() {
    List<String>? cacheData = GetFirestorePreference().getSlider();

    if (cacheData == null) {
      return [];
    }

    for (var e in cacheData) {
      data.add(SliderModel.fromMap(jsonDecode(e)));
    }

    return data;
  }

  Future<List<SliderModel>> getData(bool isReloaded,
      {reChecked = false}) async {
    if (await isDeviceOnline() && isReloaded) {
      List<SliderModel> dataCloud = await cloud();
      await SetFirestorePreference().setSlider(dataCloud);

      return dataCloud;
    } else {
      List<SliderModel> dataCache = cache();

      if (dataCache.isNotEmpty) {
        return dataCache;
      }

      if (!reChecked) {
        return getData(isReloaded, reChecked: true);
      }

      return [];
    }
  }
}
