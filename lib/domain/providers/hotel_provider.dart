import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:flutter/material.dart';

class HotelProvider with ChangeNotifier {
  List<HotelModel> hotels = [];
  List<HotelModel> unseenBadges = [];

  void saveHotel(HotelModel hotel) {
    if (!isHotelAlreadySaved(hotel)) {
      hotels.add(hotel);
      unseenBadges.add(hotel);
    } else {
      unseenBadges.removeWhere((e) => e.id == hotel.id);
    }

    notifyListeners();
  }

  bool isHotelAlreadySaved(HotelModel hotel) {
    if (hotels.isEmpty) {
      return false;
    }

    int prevSize = hotels.length;
    hotels.removeWhere((e) => e.id == hotel.id);
    int newSize = hotels.length;

    if (prevSize == newSize) {
      return false;
    }

    return true;
  }
}
