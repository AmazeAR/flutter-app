import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/Category/Categories.dart';
import 'package:flutter_amaze_ar/test.dart';

import 'Screens/Products/prodcuts.dart';
// import 'package:flutter_amaze_ar/test.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: Categories(),
    );
  }
}
