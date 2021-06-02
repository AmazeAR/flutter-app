import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/products_page.dart';
import 'package:flutter_amaze_ar/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsPage(categoryName: category.categoryName),
          ),
        );
      },
      title: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
            image: NetworkImage(category.categoryURL),
            colorFilter: ColorFilter.mode(
                Colors.green.withOpacity(0.6), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
            child: Text(
          category.categoryName,
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        )),
      ),
    );
  }
}
