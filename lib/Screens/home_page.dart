import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Provider/google_sign_in.dart';
import 'package:flutter_amaze_ar/Screens/categories_page.dart';
import 'package:flutter_amaze_ar/Screens/signin_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final GoogleSignInProvider provider =
              Provider.of<GoogleSignInProvider>(context);

          if (provider.getIsSigningIn() == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
           else if (snapshot.hasData) {
            return CategoriesPage();
          }
           else {
            return SignInPage(
              buttonText: "SignIn With Google",
              onPress: () async {
                final GoogleSignInProvider provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.login();
              },
            );
          }
        },
      ),
    );
  }
}
