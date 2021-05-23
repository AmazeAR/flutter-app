class CategoryModel {
  final String id;
  final String name;
  final String url;

  CategoryModel({required this.id, required this.name, required this.url});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['_id'] as String,
        name: json['categoryName'] as String,
        url: json['categoryImage'] as String);
  }
}
