import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appbar.dart';
import 'package:flutter_amaze_ar/Components/shoppingGrp_item.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';
import 'package:flutter_amaze_ar/Constants/constants.dart';
import 'package:flutter_amaze_ar/models/shoppingGroup_model.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/cart_services.dart';

class ShoppingGroups extends StatefulWidget {
  final String userId = UserModel.getUserId();
  @override
  _ShoppingGroupsState createState() => _ShoppingGroupsState();
}

class _ShoppingGroupsState extends State<ShoppingGroups> {
  final HttpCartServices httpCartServices = HttpCartServices();

  late Future<List<ShoppingGroup>> shoppingGroupsFuture;

  @override
  void initState() {
    super.initState();
    shoppingGroupsFuture =
        httpCartServices.getAllShoppingGroups(userId: widget.userId);
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
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
              children: shoppingGroups
                  .map((ShoppingGroup shoppingGroup) =>
                      ShoppingGroupItem(group: shoppingGroup))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
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
