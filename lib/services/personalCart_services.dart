import 'dart:convert';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:http/http.dart' as http;

class HttpPersonalCartServices {
  final String userId;

  HttpPersonalCartServices({required this.userId});

  Future<List<ProductModel>> getPersoanlCart() async {
    final res = await http
        .get(Uri.https('amazar-v1.herokuapp.com', '/personalCart/$userId'));

    // print(res.statusCode);
    if (res.statusCode == 200) {
      print("personal cart successfuly fetched!");

      var body = json.decode(res.body);
      List<dynamic> cartJson = body['data'];

      List<ProductModel> cart = cartJson
          .map((dynamic cartItem) => ProductModel.fromJson(cartItem))
          .toList();

      return cart;
    } else {
      throw Exception("Failed to fetch personalCart from personalCart/user_id");
    }
  }
}
