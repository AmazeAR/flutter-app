import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/Background.dart';
import 'package:flutter_amaze_ar/Components/appBarWithProfileIcon.dart';
import 'package:flutter_amaze_ar/Components/roundedButton.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Sizes.dart';

class AppliancesDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: appBarWithProfileIcon(size),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://picsum.photos/250?image=9"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontSize: h2,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      border: Border.all(
                        color: Colors.red,
                        width: 5,
                      )),
                ),
              ),
              RoundedButton(
                color: primaryColor,
                text: "View In 3D",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    color: primaryColor,
                    text: "Add to your cart",
                  ),
                  RoundedButton(
                    color: primaryColor,
                    text: "Add to your group cart",
                  ),
                ],
              )
              // SizedBox(height: 20, width: 40, child: Text("description")),
            ],
          ),
        ));
  }
}
