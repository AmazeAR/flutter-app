import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/RectangleButton.dart';
import 'package:flutter_amaze_ar/Components/background.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Sizes.dart';
import 'package:flutter_amaze_ar/Screens/Categories.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // GoogleSignInAccount _currentUSer;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("SignIn With Google"),
      ),

      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "AmazeAr",
                style: TextStyle(
                    fontSize: h1,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "Visuslize the better together",
                style: TextStyle(
                    fontSize: h2,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.1),
              RectangleButton(
                text: "SignIn With Google ",
                color: primaryColor,
                onTap: () {
                  Navigator.push(
                    //
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Categories();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
