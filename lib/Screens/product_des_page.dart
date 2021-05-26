import 'package:flutter/material.dart';

class ProductDescriptionPage extends StatelessWidget {
  final String productId;
  final String categoryId;
  final String categoryName;
  final String productName;
  final String brandName;
  final String productURL;
  final String price;
  final bool is3DModel;

  const ProductDescriptionPage(
      {Key? key,
      required this.productId,
      required this.categoryId,
      required this.categoryName,
      required this.productName,
      required this.brandName,
      required this.productURL,
      required this.price,
      required this.is3DModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Products description"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    productURL,
                    height: size.height * 0.4,
                    width: size.width * 0.9,
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 250.0,
                        child: Text(
                          productName,
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
                        child: Text(
                          price,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 0, 0),
                    child: Text(
                      brandName,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  )
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text("View in 3D"),
              icon: Icon(Icons.ac_unit),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.black),
                overlayColor:
                    MaterialStateProperty.resolveWith((states) => Colors.amber),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text("Personal Cart"),
                  icon: Icon(Icons.add_shopping_cart_outlined),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.amber),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Text("Group Card"),
                  icon: Icon(Icons.add_shopping_cart_outlined),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.amber),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.006,
            )
          ],
        ),
      ),
    );
  }
}
