import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/signin_btn.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Constants.dart';
import 'package:flutter_amaze_ar/Provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Container(
          decoration: kSigninPageBoxDecoration,
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
                        // sign in using firebase
                        final GoogleSignInProvider provider =
                            Provider.of<GoogleSignInProvider>(context,
                                listen: false);
                        await provider.login();
                      },
                    ),
                  ),
                  decoration: kSigninContainerBoxDecoration,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
