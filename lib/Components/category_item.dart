import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Constants.dart';
import 'package:flutter_amaze_ar/Screens/products_page.dart';
import 'package:flutter_amaze_ar/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // tap on category item
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsPage(categoryName: category.categoryName),
          ),
        );
      },
      title: Container(
        height: kCategoryItemHeight,
        decoration: kCategoryBoxDecoration(categoryURL: category.categoryURL),
        child: Center(
          child: Text(
            category.categoryName,
            style: kCategoryNameTextStyle,
          ),
        ),
      ),
    );
  }
}
