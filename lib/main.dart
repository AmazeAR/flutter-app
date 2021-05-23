import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/Categories.dart';
import 'package:flutter_amaze_ar/Screens/Personal_Cart.dart';
import 'package:flutter_amaze_ar/test.dart';

import 'Screens/Prodcuts.dart';

void main() {
  runApp(MyApp());
}

//hi sagar suman
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Categories(),
    );
  }
}
