import 'package:eapp1/data/models/firestore/i_model_json_convert.dart';

class SliderModel extends IModelJsonConvert {
  late String id;
  late String hotelId;
  late int sort;

  SliderModel();

  SliderModel.encapsulate({
    required this.id,
    required this.hotelId,
    required this.sort,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hotelId': hotelId,
      'sort': sort,
    };
  }

  @override
  SliderModel fromMap(Map<String, dynamic> map) {
    return SliderModel.encapsulate(
      id: map['id'] as String,
      hotelId: map['hotelId'] as String,
      sort: map['sort'] as int,
    );
  }

}