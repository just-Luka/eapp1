import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFirestore {
  final String collectionName;

  const BaseFirestore(this.collectionName);

  CollectionReference collection() {
    return FirebaseFirestore.instance.collection(collectionName);
  }
}
