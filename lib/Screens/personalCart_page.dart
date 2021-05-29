import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/Personal_Cart_Card.dart';
import 'package:flutter_amaze_ar/Components/appbar_with_profile.dart';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:flutter_amaze_ar/services/personalCart_services.dart';

class PersonalCart extends StatefulWidget {
  final String userId;

  const PersonalCart({required this.userId});

  @override
  _PersonalCartState createState() => _PersonalCartState();
}

class _PersonalCartState extends State<PersonalCart> {
  final HttpPersonalCartServices _httpService = HttpPersonalCartServices();

  late Future<List<ProductModel>> cartFuture;

  @override
  void initState() {
    super.initState();
    cartFuture = _httpService.getPersoanlCart(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWithProfileIcon(),
      ),
      body: FutureBuilder(
        future: cartFuture,
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> cart = snapshot.data!;
            return ListView(
              children: cart
                  .map((ProductModel item) => PersonalCartCard(
                      id: item.productId,
                      catId: item.categoryId,
                      catName: item.categoryName,
                      proName: item.productName,
                      brandName: item.brandName,
                      proImage: item.productURL,
                      price: item.price,
                      is3DModel: item.is3DModel))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            // when cart is empty
            print("haserror ${snapshot.error}");
            return Center(
              child: Container(
                height: 100.0,
                width: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueAccent,
                ),
                child: TextButton(
                  onPressed: () {
                    // redirect to category page
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 6.0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.blueAccent)),
                  child: Text(
                    "Cart is empty. Let's shop!",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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
