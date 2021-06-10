import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/user_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:localstorage/localstorage.dart';

class GoogleSignInProvider extends ChangeNotifier {

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final LocalStorage storage = LocalStorage('amaz_ar');

  bool _isSigningIn = false;

  bool getIsSigningIn() {
    return _isSigningIn;
  }

  void toggleIsSigningIn({required bool newValue}) {
    _isSigningIn = newValue;
    notifyListeners();
  }

  // signIn the user using firebase auth 
  // and posting user to mongo database
  // and storing user crdentials in localStorage
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

      storage.setItem("user", userModel.toJson());  // seting user to localStorage
      
      storage.setItem("groupId", userModel.userId); // initializing groupId same as user id for no meeting groups

      // print(storage.getItem("user"));                               
      HttpUserServices httpUserServices = HttpUserServices();
      httpUserServices.postUser(userModel);         // posting user to mongo db

      return userCredential;
    }
  }

  // signOut the user
  void logout() async {
    await googleSignIn.disconnect();
    await storage.clear();
    FirebaseAuth.instance.signOut();
  }
}
