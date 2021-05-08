import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';

AppBar appBarWithProfileIcon(final Size size) {
  // final Size ;
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
        SizedBox(width: size.width * 0.25),
        Icon(
          Icons.message,
          color: primaryColor,
        ),
        SizedBox(width: size.width * 0.02),
        Icon(
          Icons.shopping_cart,
          color: primaryColor,
        )
      ],
    ),
  );
}
