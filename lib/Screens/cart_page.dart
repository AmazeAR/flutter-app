import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/cart_card.dart';
import 'package:flutter_amaze_ar/Components/empty_cart.dart';
import 'package:flutter_amaze_ar/Constants/Constants.dart';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:flutter_amaze_ar/services/cart_services.dart';

class Cart extends StatefulWidget {
  final String id;
  final bool isPersonalCartPage;
  final String cartLabel;

  const Cart(
      {required this.id,
      required this.isPersonalCartPage,
      required this.cartLabel});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final HttpCartServices cartServices = HttpCartServices();

  late Future<List<ProductModel>> cartFuture;

  @override
  void initState() {
    super.initState();
    cartFuture = cartServices.getCart(
      id: widget.id,
      isPersonalCart: widget.isPersonalCartPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: FutureBuilder(
        future: cartFuture,
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> cart = snapshot.data!;

            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: kCartHeaderWidget(cartLabel: widget.cartLabel),
                ),
                ...cart
                    .map(
                      (ProductModel item) => CartCard(
                        id: widget.id,
                        prodId: item.productId,
                        catId: item.categoryId,
                        catName: item.categoryName,
                        proName: item.productName,
                        brandName: item.brandName,
                        proImage: item.productURL,
                        price: item.price,
                        is3DModel: item.is3DModel,
                        isPersonalCartCard: widget.isPersonalCartPage,
                      ),
                    )
                    .toList(),
              ],
            );
          } else if (snapshot.hasError) {
            // when cart is empty
            print("haserror ${snapshot.error}");
            return EmptyCart(
              isCartPage: true,
              buttonLabel: "Empty Cart. Let's shop!",
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
