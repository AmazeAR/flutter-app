import 'package:flutter/material.dart';

//Rounded button is created using this
class RoundedButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final Widget? prefixIcon;
  final Widget? childWidget;
  final Color? color;
  final Color? textColor;
  const RoundedButton({
    Key? key,
    this.color,
    this.textColor = Colors.white,
    this.prefixIcon,
    this.childWidget,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.4,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
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
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
