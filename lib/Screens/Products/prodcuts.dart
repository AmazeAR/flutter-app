import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/Products/product_card.dart';
import 'package:flutter_amaze_ar/models/products_model.dart';
import 'package:flutter_amaze_ar/services/products_services.dart';

class Products extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: FutureBuilder(
            future: httpService.getPro(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData) {
                List<Product> pros = snapshot.data!;
                return GridView.count(
                  padding: EdgeInsets.all(6),
                  crossAxisCount: 2,
                  children: pros
                      .map((Product pro) => ProductCard(
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
