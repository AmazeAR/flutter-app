import 'package:flutter/material.dart';

//Rounded button is created using this
class SmallRoundedButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final Widget prefixIcon, childWidget;
  final Color color, textColor;
  const SmallRoundedButton({
    Key key,
    this.color,
    this.textColor = Colors.white,
    this.prefixIcon,
    this.childWidget,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: size.width * 0.2,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(28.0)),
          ),
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
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
