import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/Personal_Cart_Card.dart';
import 'package:flutter_amaze_ar/Components/appbar_with_profile.dart';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:flutter_amaze_ar/services/personalCart_services.dart';

class PersonalCart extends StatefulWidget {
  @override
  _PersonalCartState createState() => _PersonalCartState();
}

class _PersonalCartState extends State<PersonalCart> {
  final HttpPersonalCartServices _httpService =
      HttpPersonalCartServices(userId: '609cfe4632e2cc480c27106d');

  late Future<List<ProductModel>> cartFuture;

  @override
  void initState() {
    super.initState();
    cartFuture = _httpService.getPersoanlCart();
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
            return Center(
              child: Text("${snapshot.error}"),
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
