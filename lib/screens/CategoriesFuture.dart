import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/WideRectangleButton.dart';
import 'package:flutter_amaze_ar/constants/Colors.dart';
import 'package:flutter_amaze_ar/models/Categories/CategoriesModel.dart';

import 'package:http/http.dart' as http;

class CategoriesFuture extends StatefulWidget {
  @override
  _CategoriesFutureState createState() => _CategoriesFutureState();
}

class _CategoriesFutureState extends State<CategoriesFuture> {
  int listCount = 0;
  Map<String, dynamic> categorylist = {};
  var categoriesName;
  Future<List<CategoriesModel>> getdata() async {
    final res =
        await http.get(Uri.parse('https://amazar-v1.herokuapp.com/categories'));

    if (res.statusCode == 200) {
      listCount = jsonDecode(res.body).length;
      var jsonData = jsonDecode(res.body);
      return (jsonData['id']['categoryName']['categoryImage'] as List)
          .map((e) => CategoriesModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  late Future<List<CategoriesModel>> getdataList;
  @override
  void initState() {
    super.initState();
    getdataList = getdata();
    print(getdataList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CategoriesModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("snapshot.data!.categoryName");
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          //  Container(
          //   child: ListView.builder(
          //       itemCount: listCount,
          //       itemBuilder: (context, i) {
          //         return WideRectangleButton(
          //           text: Text(snapshot.data!.categoryName),
          //           color: primaryColor,
          //           onTap: () {},
          //         );
          //       }),
          // );

          return CircularProgressIndicator();
        },
        future: getdataList,
      ),
    );
  }
}
