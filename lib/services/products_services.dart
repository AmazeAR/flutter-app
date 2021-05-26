import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_amaze_ar/models/product_model.dart';

class HttpProductsServices {
  Future<List<ProductModel>> getProducts({required String categoryName}) async {
    http.Response res = await http
        .get(Uri.https('amazar-v1.herokuapp.com', 'products/$categoryName'));

    if (res.statusCode == 200) {
      print("products of a specific categories are successfully fetched!");

      var body = json.decode(res.body);
      List<dynamic> productsListJson = body['data'];

      List<ProductModel> productsList = productsListJson
          .map((dynamic productJson) => ProductModel.fromJson(productJson))
          .toList();

      // print(productsList);
      return productsList;
    } else {
      throw Exception("Failed to fetch products from products/category_name");
    }
  }
}
