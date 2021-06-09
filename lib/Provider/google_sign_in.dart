import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/user_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:localstorage/localstorage.dart';

class GoogleSignInProvider extends ChangeNotifier {
  GoogleSignInProvider();

  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool _isSigningIn = false;
  final LocalStorage storage = LocalStorage('amaz_ar');

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

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      toggleIsSigningIn(newValue: false);

      // print(userCredential.user);
      UserModel userModel = UserModel(
          userId: userCredential.user!.uid,
          fullName: userCredential.user!.displayName!,
          emailId: userCredential.user!.email!,
          profileURL: userCredential.user!.photoURL!);

      storage.setItem("user", userModel.toJson());
      
      // initializing groupId same as user id for no meeting groups
      storage.setItem("groupId", userModel.userId);

      print(storage.getItem("user"));                               

      HttpUserServices httpUserServices = HttpUserServices();
      httpUserServices.postUser(userModel);

      return userCredential;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    await storage.clear();
    FirebaseAuth.instance.signOut();
  }
}
