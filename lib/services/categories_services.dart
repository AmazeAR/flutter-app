import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_amaze_ar/models/categories_model.dart';

class HttpServiceCategories {
  Future<List<CategoryModel>> getCat() async {
    http.Response res =
        await http.get(Uri.https('amazar-v1.herokuapp.com', 'categories'));
    if (res.statusCode == 200) {
      print("categories successfuly fetched!");
      List<dynamic> body = json.decode(res.body);
      List<CategoryModel> cat =
          body.map((dynamic item) => CategoryModel.fromJson(item)).toList();
      return cat;
    }
    throw "error";
  }
}
