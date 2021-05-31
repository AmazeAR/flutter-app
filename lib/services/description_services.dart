import 'dart:convert';
import 'package:flutter_amaze_ar/models/description_model.dart';
import 'package:http/http.dart' as http;

class HttpDescriptionServices {
  Future<Description> getDescription({required String productId}) async {
    http.Response res = await http
        .get(Uri.https('amazar-v1.herokuapp.com', 'description/$productId'));

    if (res.statusCode == 200) {
      print("decription of perticular product is successfully fetched!");

      var body = json.decode(res.body);

      Description description = Description.fromJson(body);
      return description;
    } else {
      throw Exception(
          "Failed to fetch product from products/product/product_id");
    }
  }
}
