import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryFirestore {
  CollectionReference category = FirebaseFirestore.instance.collection('categories');

  Future dataList() async{
      var categoryDocs = await category.get();

      return categoryDocs.docs;
  }
}