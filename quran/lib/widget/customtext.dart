import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  const CustomText(
      {required this.color,
      required this.size,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}

class CustomQuranText extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  const CustomQuranText(
      {required this.color,
      required this.size,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.justify,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}
