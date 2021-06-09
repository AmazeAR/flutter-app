import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appbar.dart';
import 'package:flutter_amaze_ar/Components/category_item.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/constants.dart';
import 'package:flutter_amaze_ar/services/categories_services.dart';
import 'package:flutter_amaze_ar/models/category_model.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final HttpCategoriesServices categoriesServices = HttpCategoriesServices();
  late Future<List<CategoryModel>> categoriesList;

  @override
  void initState() {
    super.initState();
    categoriesList = categoriesServices.getCategories();
    print(categoriesList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFourthColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarSize),
        child: AppBarWithProfileIcon(),
      ),
      body: FutureBuilder(
        future: categoriesList,
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            List<CategoryModel> categories = snapshot.data!;
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
              children: categories
                  .map((CategoryModel category) =>
                      CategoryItem(category: category))
                  .toList(),
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
