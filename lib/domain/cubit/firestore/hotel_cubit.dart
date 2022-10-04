import 'package:bloc/bloc.dart';
import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:meta/meta.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  final List<HotelModel> bookmarks = [];
  final List<HotelModel> newBadges = [];

  HotelCubit() : super(HotelInitial());

  /// adds/removes particular hotel in bookmarks
  void bookmarkPushPop(HotelModel hotel) {
    if (!_isBookmarkAlreadyAdded(hotel)) {
      bookmarks.add(hotel);
      newBadges.add(hotel);
    } else {
      newBadges.removeWhere((e) => e.id == hotel.id);
    }

    emit(HotelBookmarkAdded(
      bookmarks: bookmarks,
      newBadges: newBadges,
    ));
  }

  /// Checks if bookmark is already exist in List
  bool _isBookmarkAlreadyAdded(HotelModel hotel) {
    if (bookmarks.isEmpty) {
      return false;
    }

    int prevSize = bookmarks.length;
    bookmarks.removeWhere((e) => e.id == hotel.id);
    int newSize = bookmarks.length;

    if (prevSize == newSize) {
      return false;
    }

    return true;
  }

  void setBookmarkPreferences() {}
}
