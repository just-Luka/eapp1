import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';

class SliderFirestore extends BaseFirestore {
  const SliderFirestore() : super('sliders');

  Future getCollection() async {
    var data = await collection().get();

    return data.docs;
  }
}
