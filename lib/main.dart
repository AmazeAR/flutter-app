import 'package:flutter/material.dart';
import 'Screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      home: HomePage(),
    );
  }
}
 
// colors 005662  5669EC  2c50e2 #0093a8
