import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';

class CategoryFirestore extends BaseFirestore {
  CategoryFirestore() : super(
    reference: 'categories'
  );
}