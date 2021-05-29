// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/3DView.dart';
import 'package:flutter_amaze_ar/constants/Colors.dart';

class ClickMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ThreeDView(),
              ),
            );
          },
          child: Container(
            height: 50,
            width: 100,
            child: Text(
              "Click Me",
              style: TextStyle(color: Colors.white),
            ),
            color: primaryColor,
          )),
    );
  }
}
