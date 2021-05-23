import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/Personal_Cart_Card.dart';
import 'package:flutter_amaze_ar/Components/appBarWithProfileIcon.dart';
import 'package:flutter_amaze_ar/models/products_model.dart';
import 'package:flutter_amaze_ar/services/personal_cart_services.dart';

class PersonalCart extends StatelessWidget {
  final HttpService _httpService =
      HttpService(userid: '609cfe4632e2cc480c27106d');
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
                      id: item.id,
                      catId: item.catId,
                      catName: item.catName,
                      proName: item.proName,
                      brandName: item.brandName,
                      proImage: item.proImage,
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
