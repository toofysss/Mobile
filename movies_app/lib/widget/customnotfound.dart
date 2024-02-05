import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/contsant/root.dart';

class CustomNotFound extends StatelessWidget {
  const CustomNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(Root.notfound, fit: BoxFit.contain);
  }
}
