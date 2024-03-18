import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/contsant/root.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(Root.loading, fit: BoxFit.contain);
  }
}
