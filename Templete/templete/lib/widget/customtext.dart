import 'package:flutter/material.dart';

class CusomtText extends StatelessWidget {
  final String data;
  final double size;
  final Color color;
  const CusomtText(
      {required this.color, required this.data, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.w700),
    );
  }
}
