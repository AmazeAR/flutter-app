import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Provider/google_sign_in.dart';
import 'package:flutter_amaze_ar/Screens/cart_page.dart';
import 'package:flutter_amaze_ar/Screens/groupMeet_page.dart';
import 'package:flutter_amaze_ar/Screens/user_profile_page.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:provider/provider.dart';

class AppBarWithProfileIcon extends StatefulWidget {
  @override
  _AppBarWithProfileIconState createState() => _AppBarWithProfileIconState();
}

class _AppBarWithProfileIconState extends State<AppBarWithProfileIcon> {
  late Future<UserModel> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = UserModel.getUserFromLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: userFuture,
        builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
          if (snapshot.hasData) {
            UserModel user = snapshot.data!;
            return AppBar(
              backgroundColor: Colors.lightBlueAccent,
              elevation: 6.0,
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(user.profileURL),
                        ),
                        onTap: () {
                          // user profile btn get pressed
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return UserProfile(
                                user: user,
                                onSignOut: () {
                                  // signout button  get pressed
                                  final GoogleSignInProvider provider =
                                      Provider.of<GoogleSignInProvider>(context,
                                          listen: false);
                                  provider.logout();
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/signin', (route) => false);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "AmazAR",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => MeetingPage(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Cart(
                                  id: user.userId, isPersonalCartPage: true),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Cart(
                                  id: UserModel.getGroupId(),
                                  isPersonalCartPage: false),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.local_mall,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
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
        },
      ),
    );
  }
}
