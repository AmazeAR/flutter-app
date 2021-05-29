import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Provider/google_sign_in.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;

  const UserProfile({required this.user});

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
            onPressed: () {
              // signout button  get pressed
              final GoogleSignInProvider provider =
                  Provider.of<GoogleSignInProvider>(context);
              provider.logout();
            },
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
