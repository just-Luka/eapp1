import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';

class CategoryFirestore extends BaseFirestore {
  const CategoryFirestore() : super('categories');

  Future getCollection() async {
    var data = await collection().get();

    return data.docs;
  }
}
