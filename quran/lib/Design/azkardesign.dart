import 'package:flutter/material.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/widget/customtext.dart';

class AzkarDesign extends StatelessWidget {
  final String dscrp;
  const AzkarDesign({required this.dscrp, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Root.lang == "ar" ? 45 : 0),
              bottomRight: Radius.circular(Root.lang == "ar" ? 45 : 0),
              topRight: Radius.circular(Root.lang == "en" ? 45 : 0),
              bottomLeft: Radius.circular(Root.lang == "en" ? 45 : 0)),
          border: Border.all(
              width: 1.5,
              color: Theme.of(context).buttonTheme.colorScheme!.primary),
        ),
        child: CustomQuranText(
            color: Theme.of(context).secondaryHeaderColor,
            size: Root.fontsize,
            title: dscrp),
      ),
    );
  }
}
