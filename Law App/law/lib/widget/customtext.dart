import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double size;
  final Color color;
  final TextOverflow textOverflow;
  const CustomText(
      {required this.color,
      required this.data,
      required this.size,
      required this.textOverflow,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.amiri(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      overflow: textOverflow,
    );
  }
}
