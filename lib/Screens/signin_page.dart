import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/google_signin_button.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/constants.dart';
import 'package:flutter_amaze_ar/Provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF149cb1),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // color: kSecondaryColor,
            gradient: LinearGradient(
                colors: [kSecondaryColor, kThiredColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Column(
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
                    child: GoogleSigninButton(
                      buttonText: "SignIn with Google",
                      onPress: () async {
                        final GoogleSignInProvider provider =
                            Provider.of<GoogleSignInProvider>(context,
                                listen: false);
                        await provider.login();
                      },
                    ),
                  ),
                  decoration: kBoxDecorationOfSigninPage,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
