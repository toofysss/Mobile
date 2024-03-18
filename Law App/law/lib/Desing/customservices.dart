import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomServices extends StatelessWidget {
  final Function()? ontap;
  final String data;
  const CustomServices({required this.data, required this.ontap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ]),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 5,
              color: Theme.of(context).shadowColor,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          data,
          style: TextStyle(
              fontSize: Get.width / 20,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
