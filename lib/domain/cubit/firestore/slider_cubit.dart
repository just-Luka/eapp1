import 'package:bloc/bloc.dart';
import 'package:eapp1/config/sp_keyword.dart';
import 'package:eapp1/data/models/firestore/slider_model.dart';
import 'package:eapp1/data/repository/firestore/firestore_repository.dart';
import 'package:eapp1/data/repository/firestore/list/slider_repository.dart';
import 'package:meta/meta.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  // TODO FETCH SLIDER AND (HOTEL DATA)
  Future<void> fetchSlider(bool isReloaded) async {
    emit(SliderLoading());

    List<SliderModel> data =
        await FirestoreRepository<SliderModel>(keyword: SPKeyword.slider)
            .firestoreList(SliderRepository(), isReloaded);

    data.isNotEmpty ? emit(SliderLoaded(model: data)) : emit(SliderError());
  }
}
