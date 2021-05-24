import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appBarWithProfileIcon.dart';
import 'package:flutter_amaze_ar/Components/Product_Card.dart';
import 'package:flutter_amaze_ar/models/products_model.dart';
import 'package:flutter_amaze_ar/services/products_services.dart';

class Products extends StatelessWidget {
  final HttpServiceProducts httpService = HttpServiceProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80), child: AppBarWithProfileIcon()),
      body: Container(
        color: Colors.black12,
        child: FutureBuilder(
            future: httpService.getPro(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> pros = snapshot.data!;
                return GridView.count(
                  padding: EdgeInsets.all(6),
                  crossAxisCount: 2,
                  children: pros
                      .map((ProductModel pro) => ProductCard(
                          id: pro.id,
                          catId: pro.catId,
                          catName: pro.catName, 
                          proName: pro.proName,
                          brandName: pro.brandName,
                          proImage: pro.proImage,
                          price: pro.price,
                          is3DModel: pro.is3DModel))
                      .toList(),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
