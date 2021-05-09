import 'package:flutter/material.dart';
import 'package:flutter_amaze_ar/Constants/Colors.dart';

//Rounded button is created using this
class ItemCard extends StatelessWidget {
  final void Function() onClick;
  // ignore: non_constant_identifier_names
  final String productName;
  final int sellingPrice;
  final Image productImage;
  const ItemCard({
    Key key,
    this.onClick,
    this.productName,
    this.sellingPrice,
    this.productImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      // padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      height: 100,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: GestureDetector(
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 2, top: 8),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0, top: 4.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      //image widget
                                      child: InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all()),
                                          height: 70,
                                          width: 100,
                                          child: productImage,
                                        ),
                                      )),
                                ),
                                SizedBox(width: size.width * 0.1),
                                Align(
                                  child: RichText(
                                    text: TextSpan(
                                      text: productName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "\n $sellingPrice",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const Spacer(),
                                FlatButton(
                                    color: Colors.orange,
                                    onPressed: null,
                                    child: Text("Add to cart"))
                                // const Align(
                                //   alignment: Alignment.topRight,
                                // ),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

// class StarDisplay extends StatelessWidget {
//   final double value;
//   const StarDisplay({Key? key, this.value = 0})
//       : assert(value != null),
//         super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(5, (index) {
//         return Icon(
//           index < value ? Icons.star : Icons.star_border,
//           color: kPrimaryColor,
//           size: 15,
//         );
//       }),
//     );
//   }
// }
