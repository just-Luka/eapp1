import 'dart:convert';

import 'package:eapp1/data/models/firestore/category_model.dart';
import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/data/models/firestore/slider_model.dart';
import 'package:eapp1/internal/facades/shared_preference_facade.dart';

class SetFirestorePreference {
  Future<void> setCategory(List<CategoryModel> model) async {
    final List<String> modelJson = [];

    for (var e in model) {
      modelJson.add(jsonEncode(e.toMap()));
    }

    await SharedPreferenceFacade.setStringList('category', modelJson);
  }

  Future<void> setHotel(List<HotelModel> model) async {
    final List<String> modelJson = [];

    for (var e in model) {
      modelJson.add(jsonEncode(e.toMap()));
    }

    await SharedPreferenceFacade.setStringList('hotel', modelJson);
  }

  Future<void> setSlider(List<SliderModel> model) async {
    final List<String> modelJson = [];

    for (var e in model) {
      modelJson.add(jsonEncode(e.toMap()));
    }

    await SharedPreferenceFacade.setStringList('slider', modelJson);
  }

  // Future<void> setBookmark(List<BookmarkModel> model) async {
  //   final List<String> modelJson = [];

  //   for (var e in model) {
  //     // modelJson.add(jsonEncode(e.toMap()));
  //   }

  //   await SharedPreferenceFacade.setStringList('bookmark', modelJson);
  // }
}
