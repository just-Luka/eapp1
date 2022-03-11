import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';

class SliderFirestore extends BaseFirestore {
  const SliderFirestore() : super('sliders');

  Future getCollection(Map<String, int> sliderRange) async {
    var data = await collection()
        .orderBy('sort')
        .startAt([sliderRange['start']]).endAt([sliderRange['end']]).get();

    return data.docs;
  }
}
