import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Color color;
  final double size;
  final String? data;
  const CustomText(
      {required this.color, required this.size, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$data",
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}
