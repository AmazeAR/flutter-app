import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appbar.dart';
import 'package:flutter_amaze_ar/Components/empty_cart.dart';
import 'package:flutter_amaze_ar/Components/shopping_grp.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/constants.dart';
import 'package:flutter_amaze_ar/models/shoppingGroup_model.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/cart_services.dart';

class ShoppingGroups extends StatefulWidget {
  @override
  _ShoppingGroupsState createState() => _ShoppingGroupsState();
}

class _ShoppingGroupsState extends State<ShoppingGroups> {
  final HttpCartServices httpCartServices = HttpCartServices();

  late Future<List<ShoppingGroup>> shoppingGroupsFuture;

  @override
  void initState() {
    super.initState();
    final String userId = UserModel.getUserId();
    shoppingGroupsFuture =
        httpCartServices.getAllShoppingGroups(userId: userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFourthColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarSize),
        child: AppBarWithProfileIcon(),
      ),
      body: FutureBuilder(
        future: shoppingGroupsFuture,
        builder: (BuildContext context,
            AsyncSnapshot<List<ShoppingGroup>> snapshot) {
          if (snapshot.hasData) {
            List<ShoppingGroup> shoppingGroups = snapshot.data!;

            return GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 1,
              children: shoppingGroups
                  .map((ShoppingGroup shoppingGroup) =>
                      ShoppingGroupItem(group: shoppingGroup))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return EmptyCart(
              isCartPage: false,
              buttonLabel: "No Shopping Groups yet. let's shop together",
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
