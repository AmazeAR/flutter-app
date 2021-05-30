import 'dart:convert';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:http/http.dart' as http;

class HttpCartServices {
  Future<List<ProductModel>> getCart(
      {required String id, required bool isPersonalCart}) async {
    String url = (isPersonalCart) ? '/personalCart/$id' : '/groupCart/$id';
    String cartName = (isPersonalCart) ? 'personal cart' : 'group cart';

    final res = await http.get(Uri.https('amazar-v1.herokuapp.com', url));

    if (res.statusCode == 200) {
      print("$cartName is successfuly fetched!");

      var body = json.decode(res.body);
      var cartJson = body['data'];

      if (cartJson == null) {
        print("empty $cartName");
        throw Exception("Your $cartName cart is empty!");
      } else {
        List<dynamic> cartJsonList = cartJson;
        List<ProductModel> cart = cartJsonList
            .map((dynamic cartItem) => ProductModel.fromJson(cartItem))
            .toList();
        return cart;
      }
    } else {
      throw Exception("Failed to fetch $cartName from $url");
    }
  }

  Future<void> addToCart(
      {required String id,
      required String productId,
      required bool isPersonalCart}) async {
    String url = (isPersonalCart)
        ? '/personalCart/$id/$productId'
        : '/groupCart/$id/$productId';

    String cartName = (isPersonalCart) ? 'personal cart' : 'group cart';

    http.Response res = await http.post(
      Uri.https('amazar-v1.herokuapp.com', url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      print("request to add to $cartName successfully executed!");
      var data = jsonDecode(res.body)["data"];
      print(data);
      return;
    } else {
      throw Exception("Failed to add product to $cartName!");
    }
  }

  Future<void> deleteFromCart(
      {required String userId, required String productId}) async {
    String url = '/personalCart/$userId/$productId';

    http.Response res =
        await http.delete(Uri.https('amazar-v1.herokuapp.com', url));
    if (res.statusCode == 200) {
      print("Deleted from cart");
      var data = jsonDecode(res.body)["data"];
      print(data);
      return;
    } else {
      throw Exception("Erroeeref");
    }
    
  }
}
