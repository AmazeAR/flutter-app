import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/Appliances.dart';
import 'package:flutter_amaze_ar/Screens/Products/prodcuts.dart';
import 'package:flutter_amaze_ar/services/categories_services.dart';
import 'package:flutter_amaze_ar/models/categories_model.dart';

class Categories extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: FutureBuilder(
        future: httpService.getCat(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.hasData) {
            List<Category> cats = snapshot.data!;
            return ListView(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              children: cats
                  .map((Category cat) => ListTile(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Products()));
                        },
                        title: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(cat.url),
                              colorFilter: ColorFilter.mode(
                                  Colors.green.withOpacity(0.6),
                                  BlendMode.dstATop),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Center(
                                child: Text(
                              cat.name,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            )),
                          ),
                        ),
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
