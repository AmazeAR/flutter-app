import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/productDes_page.dart';

class ProductCard extends StatelessWidget {
  final String productId;
  final String categoryId;
  final String categoryName;
  final String productName;
  final String brandName;
  final String productURL;
  final String price;
  final bool is3DModel;

  const ProductCard({
    required this.productId,
    required this.categoryId,
    required this.categoryName,
    required this.productName,
    required this.brandName,
    required this.productURL,
    required this.price,
    required this.is3DModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          // push to productDes page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ProductDescriptionPage(
                productId: productId,
                categoryId: categoryId,
                categoryName: categoryName,
                productName: productName,
                brandName: brandName,
                productURL: productURL,
                price: price,
                is3DModel: is3DModel,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              productURL,
              height: 100,
              width: 100,
            ),
            SizedBox(
              width: 120.0,
              child: Text(
                productName,
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  price,
                  style: TextStyle(fontSize: 16),
                ),
                Icon(
                  Icons.circle,
                  color: is3DModel == true ? Colors.green : Colors.red,
                  size: 16,
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
