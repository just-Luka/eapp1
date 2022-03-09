class CategoryModel {
  final String id;
  final String name;
  final int sort;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.sort,
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
      id: map['id'] as String,
      name: map['name'] as String,
      sort: map['sort'] as int,
    );
  }
}
