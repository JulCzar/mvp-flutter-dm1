import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;

  const CustomText({
    Key? key,
    this.text = '',
    this.size = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.white,
        fontSize: size,
      ),
    );
  }
}
