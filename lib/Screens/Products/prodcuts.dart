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
      body: FutureBuilder(
          future: httpService.getPro(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasData) {
              List<Product> pros = snapshot.data!;
              return ListView(
                children: pros
                    .map((Product pro) => ProductCard())
                    .toList(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
