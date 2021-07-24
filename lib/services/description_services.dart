import 'dart:convert';
import 'package:flutter_amaze_ar/Constants/Constants.dart';
import 'package:flutter_amaze_ar/models/description_model.dart';
import 'package:http/http.dart' as http;

class HttpDescriptionServices {
  // fetch description of a particular product
  Future<Description> getDescription({required String productId}) async {
    http.Response res = await http.get(
      Uri.https(kServerUrl, 'description/$productId'),
    );

    if (res.statusCode == 200) {
      print("decription of a perticular product is successfully fetched!");

      var body = json.decode(res.body);

      Description description = Description.fromJson(body);
      return description;
    } else {
      throw Exception("Failed to fetch product description");
    }
  }
}
