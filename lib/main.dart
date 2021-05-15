import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/SignIn.dart';

void main() {
  runApp(MyApp());
}

//hi sagar
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
      home: MyHomePage(),
    );
  }
}
