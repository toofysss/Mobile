import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Design/gridcard.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customtext.dart';

class CustomMorePage extends StatelessWidget {
  final String title;
  final List item;
  final String type;
  const CustomMorePage(
      {required this.title, required this.item, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Root.appbg,
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
              colors: Root.textcolor,
              data: title,
              size: Root.textsize + 10,
              textOverflow: TextOverflow.clip),
              leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white.withOpacity(.13)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Root.appbg.withOpacity(.90),
                  Root.appbg.withOpacity(.90),
                ],
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: Root.iconsize,
              color: Colors.white,
            ),
          ),
        ),),
    
      body: GridCard(item: item, type: type),
    );
  }
}
