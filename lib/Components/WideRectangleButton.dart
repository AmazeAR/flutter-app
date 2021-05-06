import 'package:flutter/material.dart';

//Rounded button is created using this
class WideRectangleButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final Widget prefixIcon, childWidget;
  final Color color, textColor;
  const WideRectangleButton({
    Key key,
    this.text,
    this.onTap,
    this.color,
    this.textColor = Colors.white,
    this.prefixIcon,
    this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 28),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: prefixIcon),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
