import 'package:eapp1/data/models/firestore/i_model_json_convert.dart';

abstract class IFirestoreListRepository<T extends IModelJsonConvert> {
  Future<List<T>> cloud();
  List<T> cache();
}