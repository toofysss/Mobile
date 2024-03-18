import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double size;
  final Color color;
  final TextOverflow textOverflow;
  const CustomText(
      {required this.color,
      required this.data,
      required this.size,
      required this.textOverflow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      overflow: textOverflow,
    );
  }
}
