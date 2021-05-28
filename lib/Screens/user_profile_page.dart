import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Provider/google_sign_in.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<UserModel> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = UserModel.getUserFromLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userFuture,
        builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
          if (snapshot.hasData) {
            UserModel user = snapshot.data!;
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(user.profileURL),
                  Text(
                    user.fullName,
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
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
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
