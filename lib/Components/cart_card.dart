import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/productDes_page.dart';
import 'package:flutter_amaze_ar/models/user_model.dart';
import 'package:flutter_amaze_ar/services/cart_services.dart';

class PersonalCartCard extends StatelessWidget {
  final String prodId;
  final String catId;
  final String catName;
  final String proName;
  final String brandName;
  final String proImage;
  final String price;
  final bool is3DModel;
  final bool isPersonalCartCard;

  const PersonalCartCard(
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

  String getId() {
    if (isPersonalCartCard) {  // add to group cart
      return UserModel.getGroupId();
    }
    else{
      return UserModel.getUserId();  // add to personal cart
    }
  }

  void addToOppositeCart() async {
    HttpCartServices cartServices = HttpCartServices();

    await cartServices.addToCart(
        id: getId(), productId: prodId, isPersonalCart: !isPersonalCartCard);
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
              Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    proImage,
                    height: size.height * 0.2,
                    width: size.width * 0.3,
                  ),
                  SizedBox(width: size.width * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: size.height * 0.05,
                          width: size.width * 0.4,
                          child: Text(
                            proName,
                            maxLines: 1,
                            // overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                      Text(
                        price,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Column(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(""),
                      icon: Icon(
                        Icons.highlight_remove_rounded,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    TextButton.icon(
                      onPressed: addToOppositeCart,
                      label: Text(''),
                      icon: Icon(
                        Icons.add_shopping_cart,
                        size: 30,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
