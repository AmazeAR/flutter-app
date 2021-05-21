class Product {
  final String id;
  final String catId;
  final String catName;
  final String proName;
  final String brandName;
  final String proImage;
  final String price;
  final bool is3DModel;

  Product(
      {required this.id,
      required this.catId,
      required this.catName,
      required this.proName,
      required this.brandName,
      required this.proImage,
      required this.price,
      required this.is3DModel});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      catId: json['categoryId'] as String,
      catName: json['categoryName'] as String,
      proName: json['productName'] as String,
      brandName: json['brandName'] as String,
      proImage: json['productImage'] as String,
      price: json['price'] as String,
      is3DModel: json['is_3dmodel'] as bool,
    );
  }
}
