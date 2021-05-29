import 'dart:convert';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:http/http.dart' as http;

class HttpGroupCartServices {
  Future<List<ProductModel>> getGroupCart({required String groupId}) async {
    final res = await http
        .get(Uri.https('amazar-v1.herokuapp.com', '/groupCart/$groupId'));

    // print(res.statusCode);
    if (res.statusCode == 200) {
      print("group cart successfuly fetched!");

      var body = json.decode(res.body);
      var cartJson = body['data'];
      if (cartJson == null) {
        throw Exception("Group cart is empty!");
      } else {
        List<dynamic> cartJsonList = cartJson;
        List<ProductModel> cart = cartJsonList
            .map((dynamic cartItem) => ProductModel.fromJson(cartItem))
            .toList();

        return cart;
      }
    } else {
      throw Exception("Failed to fetch GroupCart from groupCart/group_id");
    }
  }

  Future<void> addToGroupCart(
      {required String groupId, required String productId}) async {
    http.Response res = await http.post(
      Uri.https('amazar-v1.herokuapp.com', 'groupCart/$groupId/$productId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode == 200) {
      print("request to add to group cart is successfully executed!");
      var data = jsonDecode(res.body)["data"];
      print(data);
      return;
    } else {
      throw Exception("Failed to add product to personal cart!");
    }
  }
}
