import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Design/customdesigncard.dart';
import 'package:movies_app/Design/customdetails.dart';

class GridCard extends StatelessWidget {
  final List item;
  final String type;
  const GridCard(
      {required this.item, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15),
        scrollDirection: Axis.vertical,
        itemCount: item.length,
        itemBuilder: (context, index) => CustomDesignCard(
            image: '${item[index]['poster_path']}',
            name: "${item[index]['name'] ?? item[index]['title']}",
            onTap: () => Get.to(() => CustomDetails(
                  id: item[index]['id'],
                  type: type,
                )),
            rate: "${item[index]['vote_average']}",
            year: item[index]['first_air_date'] != null
                ? "${DateTime.parse(item[index]['first_air_date']).year}"
                : "${DateTime.parse(item[index]['release_date']).year}"));
  }
}
