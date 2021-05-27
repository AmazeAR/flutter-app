import 'package:flutter/material.dart';

class SharedScreen extends StatefulWidget {
  @override
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black38,
      child: Text("Shared screen"),
    );
  }
}
