import 'package:eapp1/data/models/firestore/i_model_json_convert.dart';

class CategoryModel implements IModelJsonConvert{
  late int id;
  late String name;
  late int sort;

  CategoryModel();

  CategoryModel.encapsulate({
    required this.id,
    required this.name,
    required this.sort
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sort': sort,
    };
  }

  @override
  CategoryModel fromMap(Map<String, dynamic> map) {
    return CategoryModel.encapsulate(
      id: map['id'] as int,
      name: map['name'] as String,
      sort: map['sort'] as int,
    );
  }
}