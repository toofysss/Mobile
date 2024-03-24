import 'dart:ui';

import 'package:flutter/material.dart';

class BgDesign extends StatelessWidget {
  final Widget page;
  const BgDesign({required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xff1f242d),
        ),
        Positioned.fill(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox()),
        ),
        SafeArea(child: page)
      ],
    );
  }
}
