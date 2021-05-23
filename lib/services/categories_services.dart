import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_amaze_ar/models/categories_model.dart';

class HttpService {
  Future<List<CategoryModel>> getCat() async {
    http.Response res =
        await http.get(Uri.https('amazar-v1.herokuapp.com', 'categories'));
    if (res.statusCode == 200) {
      print("yes");
      List<dynamic> body = json.decode(res.body);
      List<CategoryModel> cat =
          body.map((dynamic item) => CategoryModel.fromJson(item)).toList();
      print(cat);
      return cat;
    }
    throw "error";
  }
}
