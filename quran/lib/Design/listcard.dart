import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/detailsdesign.dart';
import 'package:quran/constant/root.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String dscrp;
  const ListCard({required this.dscrp, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dscrp.isNotEmpty
          ? () => Get.to(
              () => DetailsDesign(
                    title: title,
                    dscrp: dscrp,
                  ),
              transition: Transition.fadeIn,
              curve: Curves.fastOutSlowIn)
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              width: 1.5,
              color: Theme.of(context).buttonTheme.colorScheme!.primary),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: Root.fontsize,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
