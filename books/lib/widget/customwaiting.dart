import 'package:books/constant/root.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomWaiting extends StatelessWidget {
  const CustomWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(Root.search, fit: BoxFit.fill);
  }
}
