import 'dart:convert';
import 'package:flutter_amaze_ar/models/shoppingGroup_model.dart';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:http/http.dart' as http;

class HttpCartServices {
  Future<List<ProductModel>> getCart(
      {required String id, required bool isPersonalCart}) async {
    final String url = '/cart/$id';
    String cartName = (isPersonalCart) ? 'personal cart' : 'group cart';

    final res = await http.get(Uri.https('amazar-v1.herokuapp.com', url));

    if (res.statusCode == 200) {
      print("$cartName is successfuly fetched!");

      var body = json.decode(res.body);
      var cartJson = body['data'];

      if (cartJson == null || cartJson.length == 0) {
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

  Future<String> addToCart(
      {required String id,
      required String productId,
      required bool isPersonalCart}) async {
    final String url = '/cart/$id/$productId';

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
      return 'Successfully added to $cartName';
    } else {
      throw Exception("Failed to add product to $cartName!");
    }
  }

  Future<String> deleteFromCart(
      {required String id,
      required String productId,
      required bool isPersonalCart}) async {
    final String url = '/cart/$id/$productId';

    String cartName = (isPersonalCart) ? 'personal cart' : 'group cart';

    http.Response res =
        await http.delete(Uri.https('amazar-v1.herokuapp.com', url));

    if (res.statusCode == 200) {
      print("item get deleted from $cartName ");
      var data = jsonDecode(res.body)["data"];
      print(data);
      return "Removed from the $cartName";
    } else {
      throw Exception("Failed to delete item from $cartName");
    }
  }

  Future<String> addNewShoppingGroup(
      {required String userId, required String groupId}) async {
    final String url = '/users/groupCart/$userId/$groupId';

    http.Response res = await http.post(
      Uri.https('amazar-v1.herokuapp.com', url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      print("new shopping group get added");
      var data = jsonDecode(res.body)["data"];
      print(data);
      return "new shoppingGroup: $groupId get added";
    } else {
      throw Exception("Failed to add new shoppingGroup: $groupId");
    }
  }

  Future<List<ShoppingGroup>> getAllShoppingGroups(
      {required String userId}) async {
    final String url = '/users/groupCarts/$userId';

    http.Response res =
        await http.get(Uri.https('amazar-v1.herokuapp.com', url));

    if (res.statusCode == 200) {
      print("shopping groups list fetched");
      var body = jsonDecode(res.body);
      List<dynamic> shoppingGroupsJson = body['data'];
      List<ShoppingGroup> shoppingGroups = shoppingGroupsJson
          .map((dynamic shoppingGroup) => ShoppingGroup.fromJson(shoppingGroup))
          .toList();
      return shoppingGroups;
    } else {
      throw Exception("Failed to fetch all shopping groups!");
    }
  }
}
