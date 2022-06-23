import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const CustomText({
    Key? key,
    this.text = '',
    this.size = 16,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
      ),
    );
  }
}
