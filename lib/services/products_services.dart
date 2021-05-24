import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_amaze_ar/models/products_model.dart';

class HttpServiceProducts {
  Future<List<ProductModel>> getPro() async {
    http.Response res = await http
        .get(Uri.https('amazar-v1.herokuapp.com', 'products/Electronics'));
    print(res.statusCode);
    if (res.statusCode == 200) {
      print("yes");
      print(res.body);
      List<dynamic> body =  json.decode(res.body)['data'];
      List<ProductModel> pro =
          body.map((dynamic item) => ProductModel.fromJson(item)).toList();
      print(pro);
      return pro;
    }
    throw "error";
  }
}
