import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;
  final void Function() onSignOut;

  const UserProfile({required this.user, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(user.profileURL),
          Text(
            user.fullName,
            style: TextStyle(
                color: primaryColor, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            "signed in as ${user.emailId}",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onSignOut,
            child: Text(
              "Sign out",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
