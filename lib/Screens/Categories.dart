import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/Background.dart';
import 'package:flutter_amaze_ar/Components/WideRectangleButton.dart';
import 'package:flutter_amaze_ar/Components/appBarWithProfileIcon.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Sizes.dart';
import 'package:flutter_amaze_ar/Screens/Appliances.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Categories extends StatefulWidget {
  final GoogleSignInAccount user;
  Categories({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWithProfileIcon(
          user: widget.user,
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
                        return Appliances(
                          user: widget.user,
                        );
                      },
                    ),
                  );
                },
              ),
              WideRectangleButton(
                text: "Electronics",
                color: primaryColor,
                onTap: () {},
              ),
              WideRectangleButton(
                text: "Appliances",
                color: primaryColor,
                onTap: () {},
              ),
              WideRectangleButton(
                text: "Mobile",
                color: primaryColor,
                onTap: () {},
              ),
              WideRectangleButton(
                text: "Fashion",
                color: primaryColor,
                onTap: () {},
              ),
              WideRectangleButton(
                text: "Others",
                color: primaryColor,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
