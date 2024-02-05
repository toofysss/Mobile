import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double size;
  final Color colors;
  final TextOverflow textOverflow;
  const CustomText(
      {required this.colors,
      required this.data,
      required this.size,
      required this.textOverflow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: textOverflow,
      style:
          TextStyle(fontSize: size, fontWeight: FontWeight.w700, color: colors),
    );
  }
}
