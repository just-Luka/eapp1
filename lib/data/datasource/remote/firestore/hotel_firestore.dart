import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';

class HotelFirestore extends BaseFirestore {
  const HotelFirestore() : super('hotels');

  Future getCollection() async {
    var data = await collection().get();

    return data.docs;
  }

  Future getCollectionById(String id) async {
    var data = await collection().doc(id).get();

    return data.data();
  }
}
