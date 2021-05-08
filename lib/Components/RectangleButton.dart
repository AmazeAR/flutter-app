import 'package:flutter/material.dart';

//Rounded button is created using this
class RectangleButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final Widget prefixIcon, childWidget;
  final Color color, textColor;
  const RectangleButton({
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
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
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
