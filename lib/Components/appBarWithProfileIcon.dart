import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/Message.dart';
import 'package:flutter_amaze_ar/Screens/Personal_Cart.dart';

class AppBarWithProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.lightBlueAccent,
      elevation: 6.0,
      title: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/a-/AOh14Gi2_aWR5ZzS4EX03Jk2HyFrEZEOig7Nh_GxxQLTlw=s96-c'),
                ),
                onTap: () {
                  // user profile btn get pressed
                  final user = FirebaseAuth.instance.currentUser;
                  print(user);
                },
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Text(
                "AmazAR",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Message()),
                  );
                },
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PersonalCart()));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
