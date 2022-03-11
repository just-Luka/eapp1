import 'package:bloc/bloc.dart';
import 'package:eapp1/config/widget_config.dart';
import 'package:eapp1/data/datasource/remote/firestore/hotel_firestore.dart';
import 'package:eapp1/data/datasource/remote/firestore/slider_firestore.dart';
import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/data/models/firestore/slider_model.dart';
import 'package:eapp1/data/repository/firestore/slider_repository.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  final List<HotelModel> hotelModels = [];
  final Map<String, int> sliderRange = WidgetConfig.sliderRange;

  SliderCubit() : super(SliderInitial());

  Future<void> fetchSlider(bool isReloaded) async {
    resetProperties();
    emit(SliderLoading());

    final List<SliderModel> data = await SliderRepository().getData(isReloaded);

    await fetchSliderHotels(data);

    if (hotelModels.isNotEmpty) {
      emit(SliderLoaded(model: hotelModels, completely: false));
    } else {
      emit(SliderError());
    }
  }

  Future<void> sliderLazyLoad() async {
    final int prevHotelModel = hotelModels.length;

    sliderRange['start'] = sliderRange['start']! + 3;
    sliderRange['end'] = sliderRange['end']! + 3;

    List<SliderModel> data = [];

    var cloudData = await const SliderFirestore().getCollection(sliderRange);
    cloudData.forEach((e) {
      SliderModel model = SliderModel(
        id: e.get("id"),
        hotelId: e.get("hotel_id"),
        sort: e.get("sort"),
      );

      data.add(model);
    });

    await fetchSliderHotels(data);

    prevHotelModel == hotelModels.length
        ? emit(SliderLoaded(
            model: hotelModels, completely: true)) //no more sliders left
        : emit(SliderLoaded(model: hotelModels, completely: false));
  }

  Future<void> fetchSliderHotels(List<SliderModel> sliderModels) async {
    const HotelFirestore hotel = HotelFirestore();

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
  }

  void resetProperties() {
    hotelModels.clear();
    sliderRange['start'] = 1;
    sliderRange['end'] = 3;
  }
}
