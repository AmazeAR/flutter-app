import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Screens/Cart.dart';
import 'package:flutter_amaze_ar/Screens/Message.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/widgets.dart';

class AppBarWithProfileIcon extends StatelessWidget {
  final GoogleSignInAccount user;

  const AppBarWithProfileIcon({required this.user});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          GoogleUserCircleAvatar(
            identity: user,
          ),
          SizedBox(width: size.width * 0.05),
          Text(
            "AmazeAR",
            style: TextStyle(
                // fontSize: h2,
                color: primaryColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: size.width * 0.2),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Message()));
            },
            child: Icon(
              Icons.message,
              color: primaryColor,
            ),
          ),
          SizedBox(width: size.width * 0.02),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductList()));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: primaryColor,
              )),
        ],
      ),
    );
  }
}
