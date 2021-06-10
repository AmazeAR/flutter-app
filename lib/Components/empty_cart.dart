import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Screens/groupMeet_page.dart';

class EmptyCart extends StatelessWidget {
  final bool isCartPage;
  final String buttonLabel;

  const EmptyCart({required this.isCartPage, required this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 300.0,
        child: TextButton(
          onPressed: () {
            if (isCartPage == true) {
              // redirect to category page
              Navigator.pop(context);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MeetingPage(),
                ),
              );
            }
          },
          style: ButtonStyle(
              elevation: MaterialStateProperty.resolveWith((states) => 6.0),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => kPrimaryColor)),
          child: Text(
            buttonLabel,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
