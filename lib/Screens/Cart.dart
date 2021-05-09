import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/Background.dart';
import 'package:flutter_amaze_ar/Components/ItemCard.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ItemCard(
                productName: "Product Name",
                sellingPrice: 12000,
                productImage:
                    Image.network("https://picsum.photos/250?image=9"),
              ),
              ItemCard(
                productName: "Product Name",
                sellingPrice: 12000,
                productImage:
                    Image.network("https://picsum.photos/250?image=9"),
              ),
              ItemCard(
                productName: "Product Name",
                sellingPrice: 12000,
                productImage:
                    Image.network("https://picsum.photos/250?image=9"),
              ),
              ItemCard(
                productName: "Product Name",
                sellingPrice: 12000,
                productImage:
                    Image.network("https://picsum.photos/250?image=9"),
              ),
              ItemCard(
                productName: "Product Name",
                sellingPrice: 12000,
                productImage:
                    Image.network("https://picsum.photos/250?image=9"),
              ),
              ItemCard(
                productName: "Product Name",
                sellingPrice: 12000,
                productImage:
                    Image.network("https://picsum.photos/250?image=9"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
