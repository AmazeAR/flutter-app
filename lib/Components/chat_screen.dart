import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 120,
                color: Colors.black12,
              ),
            ),
            Container(
              height: 70,
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.photo,
                        color: Colors.blue,
                        size: size.height * 0.039,
                      ),
                      onPressed: () {
                        print("emoji pressed");
                      }),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.blue,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        print(value);
                      },
                      decoration: InputDecoration.collapsed(
                          hintText: "Send a message..."),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                        size: size.height * 0.039,
                      ),
                      onPressed: () {
                        print("Send");
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
