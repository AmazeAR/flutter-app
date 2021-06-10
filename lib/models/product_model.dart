class ProductModel {
  final String productId;
  final String categoryId;
  final String categoryName;
  final String productName;
  final String brandName;
  final String productURL;
  final String price;
  final bool is3DModel;

  ProductModel({
    required this.productId,
    required this.categoryId,
    required this.categoryName,
    required this.productName,
    required this.brandName,
    required this.productURL,
    required this.price,
    required this.is3DModel,
  });

  // convert JSON to ProductModel Object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['_id'] as String,
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      productName: json['productName'] as String,
      brandName: json['brandName'] as String,
      productURL: json['productImage'] as String,
      price: json['price'] as String,
      is3DModel: json['is_3dmodel'] as bool,
    );
  }
}
