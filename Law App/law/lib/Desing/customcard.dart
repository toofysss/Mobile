import 'package:flutter/material.dart';

class CustomCardLaw extends StatelessWidget {
  final Widget widget;
  const CustomCardLaw({required this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).indicatorColor,
            borderRadius: BorderRadius.circular(15)),
        child: widget);
  }
}
