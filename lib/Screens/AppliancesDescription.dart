import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appBarWithProfileIcon.dart';
import 'package:flutter_amaze_ar/Components/roundedButton.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Sizes.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppliancesDescription extends StatelessWidget {
  final GoogleSignInAccount user;
  const AppliancesDescription({required this.user});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWithProfileIcon(
            user: user,
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
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
                SizedBox(height: size.height * 0.02),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 200,
                  child: Center(
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontSize: h2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff7ECF9E), Color(0xff00A1FC)])),
                ),
                RoundedButton(
                  color: primaryColor,
                  text: "View In 3D",
                  onTap: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      color: primaryColor,
                      text: "Add to your cart",
                      onTap: () {},
                    ),
                    RoundedButton(
                      color: primaryColor,
                      text: "Add to your group cart",
                      onTap: () {},
                    ),
                  ],
                )
                // SizedBox(height: 20, width: 40, child: Text("description")),
              ],
            ),
          ),
        ));
  }
}
