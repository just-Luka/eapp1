class HotelModel {
  final String id;
  final String location;
  final String name;
  final String per;
  final String star;
  final String price;
  final String image;
  final List categoryIds;

  const HotelModel({
    required this.id,
    required this.location,
    required this.name,
    required this.per,
    required this.star,
    required this.price,
    required this.categoryIds,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'location': location,
      'name': name,
      'per': per,
      'star': star,
      'price': price,
      'categoryIds': categoryIds,
      'image': image,
    };
  }

  factory HotelModel.fromMap(Map<String, dynamic> map) {
    return HotelModel(
      id: map['id'] as String,
      location: map['location'] as String,
      name: map['name'] as String,
      per: map['per'] as String,
      star: map['star'] as String,
      price: map['price'] as String,
      categoryIds: map['categoryIds'] as List,
      image: map['image'] as String,
    );
  }
}
