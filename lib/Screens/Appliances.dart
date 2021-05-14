import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/AppliancesCard.dart';
import 'package:flutter_amaze_ar/Components/Background.dart';
import 'package:flutter_amaze_ar/Components/appBarWithProfileIcon.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Sizes.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'AppliancesDescription.dart';

class Appliances extends StatelessWidget {
  final GoogleSignInAccount user;
  const Appliances({required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWithProfileIcon(
            user: user,
          ),
        ),
        body: Background(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Text(
              "Appliances",
              style: TextStyle(
                  fontSize: h2,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Wrap(
              children: <Widget>[
                AppliancesCard(
                  price: 150,
                  goodName: "Refrigerator",
                  returnWidget: AppliancesDescription(
                    user: user,
                  ),
                ),
                AppliancesCard(
                  price: 150,
                  goodName: "Refrigerator",
                  returnWidget: AppliancesDescription(
                    user: user,
                  ),
                ),
                AppliancesCard(
                  price: 150,
                  goodName: "Refrigerator",
                  returnWidget: AppliancesDescription(
                    user: user,
                  ),
                ),
                AppliancesCard(
                  price: 150,
                  goodName: "Refrigerator",
                  returnWidget: AppliancesDescription(
                    user: user,
                  ),
                ),
              ],
            ),
          ],
        ))));
  }
}
