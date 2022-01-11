import 'package:eapp1/data/datasource/remote/firestore/base_firestore.dart';
import 'package:eapp1/data/models/firestore/i_model_json_convert.dart';

abstract class BaseFirestoreListRepository<T extends IModelJsonConvert> {
  late BaseFirestore myFirestore;

  BaseFirestoreListRepository({
    required this.myFirestore,
  });

  final List<T> data = [];

  Future<List<T>> cloud();
  List<T> cache();
}