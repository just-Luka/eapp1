class CategoryModel {
  int id;
  String name;
  int sort;

  CategoryModel({
    required this.id,
    required this.name,
    required this.sort
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sort': sort,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      sort: map['sort'] as int,
    );
  }
}