class SliderModel {
  final String id;
  final String hotelId;
  final int sort;

  const SliderModel({
    required this.id,
    required this.hotelId,
    required this.sort,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hotelId': hotelId,
      'sort': sort,
    };
  }

  factory SliderModel.fromMap(Map<String, dynamic> map) {
    return SliderModel(
      id: map['id'] as String,
      hotelId: map['hotelId'] as String,
      sort: map['sort'] as int,
    );
  }
}
