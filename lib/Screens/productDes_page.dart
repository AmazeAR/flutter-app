import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appbar.dart';
import 'package:flutter_amaze_ar/Components/descrption_widget.dart';
import 'package:flutter_amaze_ar/Constants/constants.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/cart_services.dart';

class ProductDescriptionPage extends StatelessWidget {
  final String productId;
  final String categoryId;
  final String categoryName;
  final String productName;
  final String brandName;
  final String productURL;
  final String price;
  final bool is3DModel;

  final userId = UserModel.getUserId();
  final groupId = UserModel.getGroupId();

  ProductDescriptionPage(
      {Key? key,
      required this.productId,
      required this.categoryId,
      required this.categoryName,
      required this.productName,
      required this.brandName,
      required this.productURL,
      required this.price,
      required this.is3DModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarSize),
        child: AppBarWithProfileIcon(),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    productURL,
                    height: size.height * 0.4,
                    width: size.width * 0.9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            brandName,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            price,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: Text(
                      productName,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: DescriptionWidget(productId: productId),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // directed to 3d view of item
              },
              label: Text("View in 3D"),
              icon: Icon(Icons.ac_unit),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.black),
                overlayColor:
                    MaterialStateProperty.resolveWith((states) => Colors.amber),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    HttpCartServices personalCartServices = HttpCartServices();
                    String message = await personalCartServices.addToCart(
                        id: userId, productId: productId, isPersonalCart: true);
                    final snackBar = SnackBar(
                        content: Text(
                      message,
                      textAlign: TextAlign.center,
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  label: Text(
                    "Personal Cart",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  icon: Icon(Icons.add_shopping_cart_outlined),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow.shade700),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    print(groupId);
                    if (userId == groupId) {
                      final snackBar = SnackBar(
                          content: Text(
                        "There is no active shopping group!",
                        textAlign: TextAlign.center,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      HttpCartServices personalCartServices =
                          HttpCartServices();
                      String message = await personalCartServices.addToCart(
                          id: groupId,
                          productId: productId,
                          isPersonalCart: false);
                      final snackBar = SnackBar(
                          content: Text(
                        message,
                        textAlign: TextAlign.center,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  label: Text(
                    "Group Cart",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  icon: Icon(Icons.add_shopping_cart_outlined),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow.shade600),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.006,
            )
          ],
        ),
      ),
    );
  }
}
