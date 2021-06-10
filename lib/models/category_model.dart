class CategoryModel {
  final String categoryId;
  final String categoryName;
  final String categoryURL;

  CategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryURL});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['_id'] as String,
      categoryName: json['categoryName'] as String,
      categoryURL: json['categoryImage'] as String,
    );
  }
}
