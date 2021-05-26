import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appbar_with_profile.dart';
import 'package:flutter_amaze_ar/Screens/Prodcuts.dart';
import 'package:flutter_amaze_ar/services/categories_services.dart';
import 'package:flutter_amaze_ar/models/categories_model.dart';

class CategoriesPage extends StatelessWidget {
  final HttpServiceCategories httpService = HttpServiceCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWithProfileIcon(),
      ),
      body: FutureBuilder(
        future: httpService.getCat(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            List<CategoryModel> cats = snapshot.data!;
            return ListView(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              children: cats
                  .map((CategoryModel cat) => ListTile(
                        onTap: () {
                          Navigator.push(
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
