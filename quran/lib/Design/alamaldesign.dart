import 'package:flutter/material.dart';
import 'package:quran/Design/listcard.dart';
import 'package:quran/constant/root.dart';

class AlamalDesign extends StatelessWidget {
  final List data;
  const AlamalDesign({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) => ListCard(
            dscrp: data[index].dscrpA!,
            title:
                Root.lang == "en" ? data[index].titleE! : data[index].titleA!));
  }
}
