import 'package:flutter/material.dart';
import 'package:movies_app/Design/customdesigncard.dart';
import 'package:get/get.dart';
import 'package:movies_app/Design/customdetails.dart';

class CustomCard extends StatelessWidget {
  final List item;
  final String type;
  const CustomCard({required this.item, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                item.length,
                (index) => CustomDesignCard(
                    image: '${item[index]['poster_path']}',
                    name: "${item[index]['name'] ?? item[index]['title']}",
                    onTap: () => Get.to(() => CustomDetails(
                          id: item[index]['id'],
                          type: type,
                        )),
                    rate: "${item[index]['vote_average']}",
                    year: item[index]['first_air_date'] != null
                        ? "${DateTime.parse(item[index]['first_air_date']).year}"
                        : "${DateTime.parse(item[index]['release_date']).year}")),
          ),
        ));
  }
}
