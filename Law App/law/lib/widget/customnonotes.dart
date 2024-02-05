import 'package:flutter/material.dart';
import 'package:law/contant/root.dart';
import 'package:lottie/lottie.dart';

class CustomNoNotes extends StatelessWidget {
  const CustomNoNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(Root.nonotes, fit: BoxFit.fill));
  }
}
