import 'dart:convert';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:http/http.dart' as http;

class HttpPersonalCartServices {
  Future<List<ProductModel>> getPersoanlCart({required String userId}) async {
    final res = await http
        .get(Uri.https('amazar-v1.herokuapp.com', '/personalCart/$userId'));

    if (res.statusCode == 200) {
      print("personal cart successfuly fetched!");

      var body = json.decode(res.body);
      var cartJson = body['data'];
      print(cartJson);
      if (cartJson == null) {
        print("empty cart");
        throw Exception("Personal cart is emprty!");
      } else {
        List<dynamic> cartJsonList = cartJson;
        List<ProductModel> cart = cartJsonList
            .map((dynamic cartItem) => ProductModel.fromJson(cartItem))
            .toList();
        return cart;
      }
    } else {
      throw Exception("Failed to fetch personalCart from personalCart/user_id");
    }
  }

  Future<void> addToPersonalCart(
      {required String userId, required String productId}) async {
    http.Response res = await http.post(
      Uri.https('amazar-v1.herokuapp.com', 'personalCart/$userId/$productId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode == 200) {
      print("request to add to cart successfully executed!");
      var data = jsonDecode(res.body)["data"];
      print(data);
      return;
    } else {
      throw Exception("Failed to add product to personal cart!");
    }
  }
}
