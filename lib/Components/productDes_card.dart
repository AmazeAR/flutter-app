import 'package:flutter/material.dart';

class ProductDesCard extends StatelessWidget {
  const ProductDesCard({
    required this.productURL,
    required this.size,
    required this.brandName,
    required this.price,
    required this.productName,
  });

  final String productURL;
  final Size size;
  final String brandName;
  final String price;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            productURL,
            height: size.height * 0.4,
            width: size.width * 0.9,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    brandName,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  child: Text(
                    price,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(
              productName,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
