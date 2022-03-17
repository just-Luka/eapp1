import 'package:bloc/bloc.dart';
import 'package:eapp1/config/widget_config.dart';
import 'package:eapp1/data/datasource/remote/firestore/hotel_firestore.dart';
import 'package:eapp1/data/models/firestore/hotel_model.dart';
import 'package:eapp1/data/models/firestore/slider_model.dart';
import 'package:eapp1/data/repository/firestore/slider_repository.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  List<SliderModel> sliderModels = []; // Filled
  final List<HotelModel> hotelModels = []; // Filled

  final Map<String, int> sliderRange = WidgetConfig.sliderRange; // [0, 3]
  String currentCategoryId = '1';

  SliderCubit() : super(SliderInitial());

  Future<void> fetchSlider(bool isReloaded) async {
    resetProperties();
    emit(SliderLoading());

    sliderModels = await SliderRepository().getData(isReloaded);

    await fetchSliderHotels();

    if (hotelModels.isNotEmpty) {
      emit(SliderLoaded(
          model: hotelModels.take(sliderRange['end']!).toList(),
          completely: false));
    } else {
      emit(SliderError());
    }
  }

  // TODO : check on Network connection
  Future<void> sliderLazyLoad() async {
    await Future.delayed(const Duration(seconds: 2));

    final int amount = hotelModels.length;

    sliderRange['end'] = sliderRange['end']! + 3;

    if (amount <= sliderRange['end']!) {
      emit(SliderLoaded(model: hotelModels, completely: true));
    } else {
      emit(SliderLoaded(
          model: hotelModels.take(sliderRange['end']!).toList(),
          completely: false));
    }
  }

  // TODO : bound HotelRepository here
  Future<void> fetchSliderHotels() async {
    const HotelFirestore hotel = HotelFirestore();

    for (SliderModel model in sliderModels) {
      final data = await hotel.getCollectionById(model.hotelId);

      if (!isCategoryInclude(data["category_ids"])) {
        continue;
      }

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
    sliderRange['end'] = 3;
    sliderModels.clear();
    hotelModels.clear();
  }

  void switchCategory(String categoryId) {
    currentCategoryId = categoryId;
    fetchSlider(true);
  }

  bool isCategoryInclude(List? categoryIds) {
    if (categoryIds == null) {
      return false;
    }

    for (var e in categoryIds) {
      if (currentCategoryId == e) {
        return true;
      }
    }

    return false;
  }
}
