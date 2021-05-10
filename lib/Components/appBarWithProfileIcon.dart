import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Screens/Cart.dart';
import 'package:flutter_amaze_ar/Screens/Message.dart';

class AppBarWithProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://source.unsplash.com/50x50/?portrait',
              )),
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
