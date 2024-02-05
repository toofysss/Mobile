import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: LottieBuilder.asset("images/3r3W2V1S8z.json"));
  }
}
