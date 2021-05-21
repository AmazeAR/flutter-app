import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<Category>> getCat() async {
    http.Response res =
        await http.get(Uri.https('amazar-v1.herokuapp.com', 'categories'));
    if (res.statusCode == 200) {
      List<dynamic> body = json.decode(res.body);
      List<Category> cat =
          body.map((dynamic item) => Category.fromJson(item)).toList();
      return cat;
    }
    throw "re";
  }
}

class Category {
  final String id;
  final String name;
  final String url;

  Category({required this.id, required this.name, required this.url});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['_id'] as String,
        name: json['categoryName'] as String,
        url: json['categoryImage'] as String);
  }
}

  class Cat extends StatelessWidget {
    final HttpService httpService = HttpService();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Cate"),
        ),
        body: FutureBuilder(
          future: httpService.getCat(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              List<Category> cats = snapshot.data!;
              return ListView(
                children: cats
                    .map((Category cat) => ListTile(
                          title: Text(cat.id),
                        ))
                    .toList(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    }
  }
