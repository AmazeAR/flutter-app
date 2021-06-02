import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 300.0,
        child: TextButton(
          onPressed: () {
            // redirect to category page
            Navigator.pop(context);
          },
          style: ButtonStyle(
              elevation: MaterialStateProperty.resolveWith((states) => 6.0),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => kPrimaryColor)),
          child: Text(
            "Cart is empty. Let's shop!",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
