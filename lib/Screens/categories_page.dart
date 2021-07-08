import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/category_item.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Constants.dart';
import 'package:flutter_amaze_ar/services/categories_services.dart';
import 'package:flutter_amaze_ar/models/category_model.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final HttpCategoriesServices categoriesServices = HttpCategoriesServices();
  late Future<List<CategoryModel>> categoriesListFuture;

  @override
  void initState() {
    super.initState();
    categoriesListFuture = categoriesServices.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFourthColor,
      appBar: kAppBar,
      body: FutureBuilder(
        future: categoriesListFuture,
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            List<CategoryModel> categories = snapshot.data!;
            return RefreshIndicator(
              onRefresh: categoriesServices.getCategories,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                children: categories
                    .map((CategoryModel category) =>
                        CategoryItem(category: category))
                    .toList(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
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
