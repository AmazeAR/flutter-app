import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/productDes_page.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/cart_services.dart';

class CartCard extends StatelessWidget {
  final String prodId;
  final String catId;
  final String catName;
  final String proName;
  final String brandName;
  final String proImage;
  final String price;
  final bool is3DModel;
  final bool isPersonalCartCard;

  CartCard(
      {Key? key,
      required this.prodId,
      required this.catId,
      required this.catName,
      required this.proName,
      required this.brandName,
      required this.proImage,
      required this.price,
      required this.is3DModel,
      required this.isPersonalCartCard})
      : super(key: key);

  final HttpCartServices cartServices = HttpCartServices();

  String getId() {
    // for deleting
    if (isPersonalCartCard) {
      return UserModel.getUserId();
    } else {
      return UserModel.getGroupId();
    }
  }

  String getOppositeId() {
    if (isPersonalCartCard) {
      // add to group cart
      return UserModel.getGroupId();
    } else {
      return UserModel.getUserId(); // add to personal cart
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ProductDescriptionPage(
                productId: prodId,
                categoryId: catId,
                categoryName: catName,
                productName: proName,
                brandName: brandName,
                productURL: proImage,
                price: price,
                is3DModel: is3DModel),
          ),
        );
      },
      child: Container(
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Image.network(
                  proImage,
                  height: size.height * 0.2,
                  width: size.width * 0.3,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        proName,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        price,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          String message = await cartServices.deleteFromCart(
                              isPersonalCart: isPersonalCartCard,
                              id: getId(),
                              productId: prodId);
                          final snackBar = SnackBar(
                              content: Text(
                            message,
                            textAlign: TextAlign.center,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        label: Text(
                          "Remove from cart",
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                        icon: Icon(
                          Icons.delete_outline,
                          size: 25,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.yellow.shade600),
                          foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black),
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          String message = await cartServices.addToCart(
                              id: getOppositeId(),
                              productId: prodId,
                              isPersonalCart: !isPersonalCartCard);
                          final snackBar = SnackBar(
                              content: Text(
                            message,
                            textAlign: TextAlign.center,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        label: Text(
                          (isPersonalCartCard)
                              ? "Add to group cart"
                              : "Add to personal cart",
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                        icon: Icon(
                          Icons.add_shopping_cart,
                          size: 30,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.yellow.shade700),
                          foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.black),
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
