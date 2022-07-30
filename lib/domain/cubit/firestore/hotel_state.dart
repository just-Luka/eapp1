part of 'hotel_cubit.dart';

@immutable
abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelBookmarkAdded extends HotelState {
  final List<HotelModel> bookmarks;
  final List<HotelModel> newBadges;

  HotelBookmarkAdded({
    required this.bookmarks,
    required this.newBadges,
  });
}
