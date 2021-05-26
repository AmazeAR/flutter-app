import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/Personal_Cart_Card.dart';
import 'package:flutter_amaze_ar/Components/appbar_with_profile.dart';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:flutter_amaze_ar/services/personal_cart_services.dart';

class PersonalCart extends StatelessWidget {
  final HttpServicePersonalCart _httpService =
      HttpServicePersonalCart(userid: '609cfe4632e2cc480c27106d');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWithProfileIcon(),
      ),
      body: FutureBuilder(
        future: _httpService.getPersoanlCart(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> personalCartPro = snapshot.data!;
            return ListView(
              children: personalCartPro
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
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
