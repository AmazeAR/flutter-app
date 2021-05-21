class Category {
  final String id;
  final String name;
  final String url;

  Category({required this.id, required this.name, required this.url});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['_id'] as String,
        name: json['categoryName'] as String,
        url: json['categoryImage'] as String);
  }
}
