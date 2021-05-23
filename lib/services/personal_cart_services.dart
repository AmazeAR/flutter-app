import 'dart:convert';

import 'package:flutter_amaze_ar/models/personal_cart_model.dart';
import 'package:flutter_amaze_ar/models/products_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  String userid;

  HttpService({required this.userid});

  Future<List<ProductModel>> getPersoanlCart() async {
    final res = await http.get(Uri.https(
        'amazar-v1.herokuapp.com', '/personalCart/609cfe4632e2cc480c27106d'));
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
