import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Components/appbar.dart';
import 'package:flutter_amaze_ar/Components/product_item.dart';
import 'package:flutter_amaze_ar/models/product_model.dart';
import 'package:flutter_amaze_ar/services/products_services.dart';

class ProductsPage extends StatefulWidget {
  final String categoryName;

  const ProductsPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final HttpProductsServices productsServices = HttpProductsServices();
  late Future<List<ProductModel>> productsList;

  @override
  void initState() {
    super.initState();
    productsList =
        productsServices.getProducts(categoryName: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarWithProfileIcon(),
      ),
      body: Container(
        color: Colors.black12,
        child: FutureBuilder(
            future: productsList,
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.count(
                  padding: EdgeInsets.all(6),
                  crossAxisCount: 2,
                  children: products
                      .map((ProductModel product) => ProductCard(
                          productId: product.productId,
                          categoryId: product.categoryId,
                          categoryName: product.categoryName,
                          productName: product.productName,
                          brandName: product.brandName,
                          productURL: product.productURL,
                          price: product.price,
                          is3DModel: product.is3DModel))
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
            }),
      ),
    );
  }
}
