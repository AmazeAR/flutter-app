import 'dart:convert';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:http/http.dart' as http;

class HttpGroupCartServices {
  final String groupId;

  HttpGroupCartServices({required this.groupId});

  Future<List<ProductModel>> getGroupCart() async {
    final res = await http
        .get(Uri.https('amazar-v1.herokuapp.com', '/personalCart/$groupId'));

    // print(res.statusCode);
    if (res.statusCode == 200) {
      print("group cart successfuly fetched!");

      var body = json.decode(res.body);
      List<dynamic> cartJson = body['data'];

      //TODO: need a check for empty cart

      List<ProductModel> cart = cartJson
          .map((dynamic cartItem) => ProductModel.fromJson(cartItem))
          .toList();

      return cart;
    } else {
      throw Exception("Failed to fetch GroupCart from groupCart/group_id");
    }
  }
}
