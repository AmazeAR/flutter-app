import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/AppBarWithoutProfileIcon.dart';

class Message extends StatefulWidget {
  Message({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWithoutProfileIcon(),
      ),

      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new Material(
              child: new Text(""),
            ),
          ),
          new Container(
            color: Colors.white,
            padding: new EdgeInsets.all(10.0),
            child: new TextField(
              decoration: new InputDecoration(
                hintText: 'Chat message',
              ),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
