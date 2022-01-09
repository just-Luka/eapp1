import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFirestore {
  String reference;

  BaseFirestore({
    required this.reference
  });

  CollectionReference initCollection() {
    return FirebaseFirestore.instance.collection(reference);
  }

  Future docCollection() async{
    var data = await initCollection().get();

    return data.docs;
  }
}