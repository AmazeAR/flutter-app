import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String id;
  final String catId;
  final String catName;
  final String proName;
  final String brandName;
  final String proImage;
  final String price;
  final bool is3DModel;

  const ProductDescription(
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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Products dis"),
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
                    proImage,
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
                          proName,
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
