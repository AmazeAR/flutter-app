import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/google_signin_button.dart';
import 'package:flutter_amaze_ar/Constants/constants.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AmazAR",
                    style: kTitleTextStyleOfSigninPage,
                  ),
                  Text(
                    "Visualize Better Together!",
                    style: kLabelTextStyleOfSigninPage,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                child: GoogleSigninButton(),
              ),
              decoration: kBoxDecorationOfSigninButton,
            ),
          )
        ],
      ),
    );
  }
}