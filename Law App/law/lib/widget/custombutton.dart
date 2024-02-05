import 'package:flutter/material.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customtext.dart';

class CustomButton extends StatelessWidget {
  final Function()? ontap;
  final String data;
  const CustomButton({required this.data, required this.ontap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Root.primary),
        child: Center(
          child: CustomText(
              color: Root.secondry,
              data: data,
              size: Root.headersize,
              textOverflow: TextOverflow.clip),
        ),
      ),
    );
  }
}
