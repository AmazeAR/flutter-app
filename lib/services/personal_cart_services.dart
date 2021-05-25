import 'dart:convert';
import 'package:flutter_amaze_ar/models/products_model.dart';
import 'package:http/http.dart' as http;

class HttpServicePersonalCart {
  String userid;

  HttpServicePersonalCart({required this.userid});

  Future<List<ProductModel>> getPersoanlCart() async {
    final res = await http
        .get(Uri.https('amazar-v1.herokuapp.com', '/personalCart/$userid'));
    print(res.statusCode);
    if (res.statusCode == 200) {
      List<dynamic> body = json.decode(res.body)['data'];
      List<ProductModel> der =
          body.map((dynamic item) => ProductModel.fromJson(item)).toList();
      print(der);
      return der;
    }
    throw 'res';
  }
}