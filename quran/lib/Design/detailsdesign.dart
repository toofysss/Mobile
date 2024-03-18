import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/root.dart';

class DetailsDesign extends StatelessWidget {
  final String dscrp;
  final String title;
  const DetailsDesign({required this.title, required this.dscrp, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Theme.of(context).appBarTheme.iconTheme!.color,
                size: Root.iconsize - 3,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              dscrp,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Root.fontsize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
