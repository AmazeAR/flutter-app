import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSigninButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.blue),
        elevation: MaterialStateProperty.resolveWith((states) => 6.0),
      ),
      onPressed: () {
        final GoogleSignInProvider provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.login();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Sign In With Google",
          style: TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
