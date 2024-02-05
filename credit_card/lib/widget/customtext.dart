import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double size;
  final Color colors;
  final FontWeight fontWeight;
  const CustomText(
      {required this.colors,
      required this.data,
      required this.fontWeight,
      required this.size,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(fontSize: size, color: colors, fontWeight: fontWeight),
    );
  }
}
