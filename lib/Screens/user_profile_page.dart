import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';

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
            return Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
                child: Column(
                  children: [
                    Image.network(user.profileURL),
                    SizedBox(height: 80),
                    Text(
                      user.fullName,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
