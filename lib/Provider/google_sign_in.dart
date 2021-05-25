import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInProvider extends ChangeNotifier {
  GoogleSignInProvider();

  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool _isSigningIn = false;

  bool getIsSigningIn() {
    return _isSigningIn;
  }

  void toggleIsSigningIn({required bool newValue}) {
    _isSigningIn = newValue;
    notifyListeners();
  }

  Future login() async {
    toggleIsSigningIn(newValue: true);

    final GoogleSignInAccount? user = await googleSignIn.signIn();
    if (user == null) {
      toggleIsSigningIn(newValue: false);
      return;
    } else {
      final GoogleSignInAuthentication googleAuth = await user.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      toggleIsSigningIn(newValue: false);
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

}
