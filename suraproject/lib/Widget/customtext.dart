import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final Color color;
  final double size;
  final TextOverflow overflow;
  const CustomText(
      {required this.color,
      required this.data,
      required this.size,
      required this.overflow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
      overflow: overflow,
    );
  }
}
