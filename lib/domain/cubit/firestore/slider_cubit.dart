import 'package:bloc/bloc.dart';
import 'package:eapp1/data/datasource/remote/firestore/hotel_firestore.dart';
import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/data/models/firestore/slider_model.dart';
import 'package:eapp1/data/repository/firestore/slider_repository.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  Future<void> fetchSlider(bool isReloaded) async {
    emit(SliderLoading());

    List<SliderModel> data = await SliderRepository().getData(isReloaded);

    List<HotelModel> hotelData = await fetchSliderHotels(data);

    data.isNotEmpty
        ? emit(SliderLoaded(model: hotelData))
        : emit(SliderError());
  }

  Future<List<HotelModel>> fetchSliderHotels(
      List<SliderModel> sliderModels) async {
    const HotelFirestore hotel = HotelFirestore();

    final List<HotelModel> hotelModels = [];

    for (SliderModel model in sliderModels) {
      final data = await hotel.getCollectionById(model.hotelId);

      HotelModel hotelModel = HotelModel(
        id: data["id"],
        location: data["location"],
        name: data["name"],
        per: data["per"],
        star: data["star"],
        price: data["price"],
        categoryIds: data["category_ids"],
      );

      hotelModels.add(hotelModel);
    }

    return hotelModels;
  }
}
