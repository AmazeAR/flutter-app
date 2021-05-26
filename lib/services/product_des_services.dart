// import 'dart:convert';
// import 'package:flutter_amaze_ar/models/product_des_model.dart';
// import 'package:http/http.dart' as http;

// class HttpProductDescriptionServices {
//   Future<ProductDescription> getProductWithDescription(
//       {required String productId}) async {
//     http.Response res = await http.get(
//         Uri.https('amazar-v1.herokuapp.com', 'products/product/$productId'));

//     if (res.statusCode == 200) {
//       print("perticular product is successfully fetched!");

//       var body = json.decode(res.body);
//       List<dynamic> productListJson =
//           body['data']; // single product will come in array of one item

//       List<ProductDescription> productList = productListJson
//           .map(
//               (dynamic productJson) => ProductDescription.fromJson(productJson))
//           .toList();

//       ProductDescription product = productList[0];
//       // print(product);
//       return product;
//     } else {
//       throw Exception("Failed to fetch product from products/product/product_id");
//     }
//   }
// }
