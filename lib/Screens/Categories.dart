import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/WideRectangleButton.dart';
import 'package:flutter_amaze_ar/Components/background.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Sizes.dart';

class Categories extends StatefulWidget {
  Categories({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/50x50/?portrait',
                )),
            SizedBox(width: size.width * 0.05),
            Text(
              "AmazeAR",
              style: TextStyle(
                  // fontSize: h2,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: size.width * 0.25),
            Icon(
              Icons.message,
              color: primaryColor,
            ),
            SizedBox(width: size.width * 0.02),
            Icon(
              Icons.shopping_cart,
              color: primaryColor,
            )
          ],
        ),
      ),

      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Categories",
                style: TextStyle(
                    fontSize: h2,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              WideRectangleButton(
                text: "Home Decor",
                color: primaryColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Categories();
                      },
                    ),
                  );
                },
              ),
              WideRectangleButton(
                text: "Electronics",
                color: primaryColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Categories();
                      },
                    ),
                  );
                },
              ),
              WideRectangleButton(
                text: "Appliances",
                color: primaryColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Categories();
                      },
                    ),
                  );
                },
              ),
              WideRectangleButton(
                text: "Mobile",
                color: primaryColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Categories();
                      },
                    ),
                  );
                },
              ),
              WideRectangleButton(
                text: "Fashion",
                color: primaryColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Categories();
                      },
                    ),
                  );
                },
              ),
              WideRectangleButton(
                text: "Others",
                color: primaryColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Categories();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
