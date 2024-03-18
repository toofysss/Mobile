import 'package:flutter/material.dart';
import 'package:lawdashboard/constant/root.dart';
import 'package:lottie/lottie.dart';

class Customloading extends StatelessWidget {
  const Customloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(Root.loading, fit: BoxFit.contain));
  }
}
