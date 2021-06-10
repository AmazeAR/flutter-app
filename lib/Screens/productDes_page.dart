import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/descrption_widget.dart';
import 'package:flutter_amaze_ar/Components/productDes_card.dart';
import 'package:flutter_amaze_ar/Constants/Constants.dart';
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

  ProductDescriptionPage({
    required this.productId,
    required this.categoryId,
    required this.categoryName,
    required this.productName,
    required this.brandName,
    required this.productURL,
    required this.price,
    required this.is3DModel,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: kAppBar,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductDesCard(
              productURL: productURL,
              size: size,
              brandName: brandName,
              price: price,
              productName: productName,
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
                  // add item to persaonl cart
                  onPressed: () async {
                    HttpCartServices cartServices = HttpCartServices();
                    String message = await cartServices.addToCart(
                      id: userId,
                      productId: productId,
                      isPersonalCart: true,
                    );
                    final snackBar = SnackBar(
                      content: Text(
                        message,
                        textAlign: TextAlign.center,
                      ),
                    );
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
                  // add item to group cart if there is an active group
                  onPressed: () async {
                    if (userId == groupId) {
                      // there is no active group
                      final snackBar = SnackBar(
                        content: Text(
                          "There is no active shopping group!",
                          textAlign: TextAlign.center,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      // add item to active group
                      HttpCartServices cartServices = HttpCartServices();
                      String message = await cartServices.addToCart(
                        id: groupId,
                        productId: productId,
                        isPersonalCart: false,
                      );
                      final snackBar = SnackBar(
                        content: Text(
                          message,
                          textAlign: TextAlign.center,
                        ),
                      );
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

