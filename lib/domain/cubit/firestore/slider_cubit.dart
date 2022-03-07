import 'package:bloc/bloc.dart';
import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';
import 'package:eapp1/data/datasource/remote/firestore/hotel_firestore.dart';
import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/data/models/firestore/slider_model.dart';
import 'package:eapp1/data/repository/firestore/firestore_repository.dart';
import 'package:eapp1/data/repository/firestore/list/slider_repository.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  BaseFirestore hotel = HotelFirestore();

  SliderCubit() : super(SliderInitial());

  Future<void> fetchSlider(bool isReloaded) async {
    emit(SliderLoading());

    List<SliderModel> data =
        await FirestoreRepository<SliderModel>(keyword: SPKeyword.slider)
            .firestoreList(SliderRepository(), isReloaded);

    List<HotelModel> hotelData = await fetchSliderHotels(data);

    data.isNotEmpty
        ? emit(SliderLoaded(model: hotelData))
        : emit(SliderError());
  }

  Future<List<HotelModel>> fetchSliderHotels(List<SliderModel> sliderModels) async {
    BaseFirestore hotel = HotelFirestore();
    List<HotelModel> hotelModels = [];

    for (SliderModel model in sliderModels) {
      final data = await hotel.docCollectionById(model.hotelId);

      HotelModel hotelModel = HotelModel.encapsulate(
          id: data["id"],
          location: data["location"],
          name: data["name"],
          per: data["per"],
          star: data["star"],
          price: data["price"],
          categoryIds: data["category_ids"]);

      hotelModels.add(hotelModel);
    }

    return hotelModels;
  }

  void filterByCategory() {
    // pass
  }
}
