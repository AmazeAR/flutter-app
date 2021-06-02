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
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(user.profileURL),
                  ),
                ),
              )),
          Expanded(
            child: Text(
              user.fullName,
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              "signed in as ${user.emailId}",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: TextButton(
                onPressed: onSignOut,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
