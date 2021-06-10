import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_amaze_ar/models/product_model.dart';

class HttpProductsServices {
  // get products of a specific category without desciption from db
  Future<List<ProductModel>> getProducts({required String categoryName}) async {
    http.Response res = await http.get(
      Uri.https('amazar-v1.herokuapp.com', 'products/$categoryName'),
    );

    if (res.statusCode == 200) {
      print("$categoryName products are successfully fetched!");

      var body = json.decode(res.body);
      List<dynamic> productsListJson = body['data'];

      // convert list of JSON to list of ProductModels
      List<ProductModel> productsList = productsListJson
          .map((dynamic productJson) => ProductModel.fromJson(productJson))
          .toList();

      return productsList;
    } else {
      throw Exception("Failed to fetch $categoryName products");
    }
  }
}
