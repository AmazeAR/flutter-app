class ProductDescription {
  final description;

  ProductDescription({required this.description});

  factory ProductDescription.fromJson(Map<String, dynamic> json) {
    return ProductDescription(
      description: json['description'],
    );
  }
}
