import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Screens/Product_Description.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String catId;
  final String catName;
  final String proName;
  final String brandName;
  final String proImage;
  final String price;
  final bool is3DModel;

  const ProductCard(
      {Key? key,
      required this.id,
      required this.catId,
      required this.catName,
      required this.proName,
      required this.brandName,
      required this.proImage,
      required this.price,
      required this.is3DModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProductDescription(
                      id: id,
                      catId: catId,
                      catName: catName,
                      proName: proName,
                      brandName: brandName,
                      proImage: proImage,
                      price: price,
                      is3DModel: is3DModel)));
        },
        child: Column(
          children: [
            Image.network(
              proImage,
              height: 100,
              width: 100,
            ),
            SizedBox(
              width: 120.0,
              child: Text(
                proName,
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
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
