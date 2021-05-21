import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_amaze_ar/models/categories_model.dart';

class HttpService {
  Future<List<Category>> getCat() async {
    http.Response res =
        await http.get(Uri.https('amazar-v1.herokuapp.com', 'categories'));
    if (res.statusCode == 200) {
      print("yes");
      List<dynamic> body = json.decode(res.body);
      List<Category> cat =
          body.map((dynamic item) => Category.fromJson(item)).toList();
      return cat;
    }
    throw "error";
  }
}
