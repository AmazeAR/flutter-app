import 'package:flutter/material.dart';

class PersonalCartCard extends StatelessWidget {
  final String id;
  final String catId;
  final String catName;
  final String proName;
  final String brandName;
  final String proImage;
  final String price;
  final bool is3DModel;

  const PersonalCartCard(
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
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  proImage,
                  height: size.height * 0.2,
                  width: size.width * 0.3,
                ),
                SizedBox(width: size.width * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.4,
                        child: Text(
                          proName,
                          maxLines: 1,
                          // overflow: TextOverflow.fade,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Text(
                      price,
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    label: Text(""),
                    icon: Icon(
                      Icons.highlight_remove_rounded,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: Text(''),
                    icon: Icon(
                      Icons.add_shopping_cart,
                      size: 30,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
