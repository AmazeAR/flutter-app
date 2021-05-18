import 'dart:convert';
import 'package:flutter_amaze_ar/models/Categories/CategoriesModel.dart';
import 'package:http/http.dart' as http;

class CategoriesAPI {
  static const String url = 'https://amazar-v1.herokuapp.com/categories';

/////////////////////////////////////////
  Future<void> getdata() async {
    var res =
        await http.get(Uri.parse('https://amazar-v1.herokuapp.com/categories'));
    print(res.body);
  }

////////////////////////////////////////

  static Future<List<CategoriesModel>> getCategories() async {
    // var res = await http.get(Uri.parse(url));
    // print(res);
    // return res;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<CategoriesModel> list = parseCategories(response.body);
        return list;
        print(list);
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<CategoriesModel> parseCategories(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CategoriesModel>((json) => CategoriesModel.fromJson(json))
        .toList();
  }
}
