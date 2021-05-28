import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/google_signin_button.dart';
import 'package:flutter_amaze_ar/Constants/constants.dart';

class SignInPage extends StatelessWidget {
  final String buttonText;
  final void Function() onPress;
  final bool isSignInPage;

  SignInPage(
      {required this.buttonText,
      required this.onPress,
      required this.isSignInPage});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (isSignInPage
                      // ignore: dead_code
                      ? Container()
                      : Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 10.0),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                            showCursor: true,
                            decoration: kTextFieldInputDecoration,
                          ),
                        )),
                  SizedBox(
                    height: 50.0,
                  ),
                  GoogleSigninButton(
                    buttonText: buttonText,
                    onPress: onPress,
                  ),
                ],
              ),
              decoration: kBoxDecorationOfSigninPage,
            ),
          )
        ],
      ),
    );
  }
}
