import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Screens/categories_page.dart';

class AppBarWithoutProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              Icons.group,
              color: primaryColor,
            ),
          ),
          // SizedBox(width: size.width * 0.05),
          Expanded(
            flex: 5,
            child: Text(
              "Kapil's Birthday",
              style: TextStyle(
                  // fontSize: h2,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.fade,
            ),
          ),
          SizedBox(width: size.width * 0.02),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CategoriesPage()));
            },
            icon: Icon(
              Icons.shopping_cart,
              color: primaryColor,
            )),
        GestureDetector(
          onTap: () {
            // add member button get pressed
          },
          child: Icon(
            Icons.person_add_sharp,
            color: primaryColor,
          ),
        ),
        SizedBox(width: size.width * 0.02),
      ],
    );
  }
}
