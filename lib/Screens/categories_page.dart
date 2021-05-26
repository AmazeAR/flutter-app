import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appbar_with_profile.dart';
import 'package:flutter_amaze_ar/Screens/products_page.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
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
                  .map((CategoryModel category) => ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Products(categoryName: category.categoryName),
                            ),
                          );
                        },
                        title: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(category.categoryURL),
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
                              category.categoryName,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            )),
                          ),
                        ),
                      ))
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
