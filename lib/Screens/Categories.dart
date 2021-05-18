import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/Background.dart';
import 'package:flutter_amaze_ar/Components/appBarWithProfileIcon.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/Sizes.dart';
import 'package:flutter_amaze_ar/Screens/Appliances.dart';
import 'package:flutter_amaze_ar/Services/CategoriesAPI.dart';
import 'package:flutter_amaze_ar/components/WideRectangleButton.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Categories extends StatefulWidget {
  final GoogleSignInAccount user;
  Categories({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Categories> {
  // List<CategoriesModel> categorieslist = [
  //   CategoriesModel(
  //     id: 4,
  //     categoryName: "Sagar",
  //   ),
  //   CategoriesModel(
  //     id: 2,
  //     categoryName: "Manish",
  //   ),
  // ];

  /////////////////////////////////////////
  Future<void> getdata() async {
    var res =
        await http.get(Uri.parse('https://amazar-v1.herokuapp.com/categories'));
    print(res.body);
  }

////////////////////////////////////////
  // @override
  // void initState() {
  //   super.initState();
  //   CategoriesAPI.getCategories().then((value) => setState(() {
  //         categorieslist = value;
  //       }));
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWithProfileIcon(
          user: widget.user,
        ),
      ),

      body: Background(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Categories",
                style: TextStyle(
                    fontSize: h2,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.02),
              // ListView.builder(
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: categorieslist.length,
              //     itemBuilder: (context, index) {
              //       // return Text(categorieslist[index].categoryName);
              //       return WideRectangleButton(
              //         text: categorieslist[index].categoryName,
              //         color: primaryColor,
              //         onTap: getdata,
              //       );
              //     }),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
