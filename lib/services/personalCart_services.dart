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

      if (cartJson == null) {
        throw Exception("Personal cart is emprty!");
      } else {
        List<ProductModel> cart = cartJson
            .map((dynamic cartItem) => ProductModel.fromJson(cartItem))
            .toList();
        return cart;
      }
      //TODO: need a check for empty cart

    } else {
      throw Exception("Failed to fetch personalCart from personalCart/user_id");
    }
  }
}
