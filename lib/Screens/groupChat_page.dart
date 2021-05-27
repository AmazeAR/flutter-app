import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appbar_without_profile.dart';
import 'package:flutter_amaze_ar/Components/chat_screen.dart';
import 'package:flutter_amaze_ar/Components/member_screen.dart';
import 'package:flutter_amaze_ar/Components/shared_screen.dart';

class GroupChat extends StatefulWidget {
  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  var selectedIndex = 0;
  final List<String> category = ['Chats', 'Members', 'Screen'];

  Widget toggler() {
    if (selectedIndex == 0) {
      return ChatsScreen();
    } else if (selectedIndex == 1) {
      return MemberScreeen();
    } else {
      return SharedScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWithoutProfileIcon(),
      ),
      body: Column(
        children: [
          Container(
            height: 70.0,
            color: Theme.of(context).primaryColor,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Text(
                        category[index],
                        style: TextStyle(
                            color: index == selectedIndex
                                ? Colors.white
                                : Colors.white60,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0),
                      ),
                    ),
                  );
                }),
          ),
          toggler(),
        ],
      ),
    );
  }
}
