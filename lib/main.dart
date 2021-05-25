import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/signin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AmazAR',
      theme: ThemeData.light().copyWith(),
      home: SignInPage(),
    );
  }
}
 
// colors 005662  5669EC  2c50e2 #0093a8
                    