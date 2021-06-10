import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_amaze_ar/models/category_model.dart';

class HttpCategoriesServices {
  
  // fetching all categories from server
  Future<List<CategoryModel>> getCategories() async {
    http.Response res = await http.get(
      Uri.https('amazar-v1.herokuapp.com', 'categories'),
    );

    if (res.statusCode == 200) {
      print("categories successfuly fetched!");

      var body = json.decode(res.body);
      List<dynamic> categoriesListJson = body['data'];

      // convert List of JSON to List of CategoryModel
      List<CategoryModel> categoriesList = categoriesListJson
          .map((dynamic categoryJson) => CategoryModel.fromJson(categoryJson))
          .toList();
      
      return categoriesList;
    } else {
      throw Exception("Failed to fetch categories from /categories api");
    }
  }
}
