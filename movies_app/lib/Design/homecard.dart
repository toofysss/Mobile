import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Design/customdesigncard.dart';
import 'package:movies_app/Design/gridcard.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customtext.dart';
import 'package:movies_app/Design/customdetails.dart';

class HomeCard extends StatelessWidget {
  final List item;
  final String title;
  final String type;
  const HomeCard(
      {required this.item, required this.type, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  textOverflow: TextOverflow.ellipsis,
                  colors: Root.textcolor,
                  data: title,
                  size: Root.textsize),
              GestureDetector(
                  onTap: () => Get.to(
                        () => GridCard(
                          item: item,
                          type: type,
                        ),
                        transition: Transition.fadeIn,
                      ),
                  child: CustomText(
                      textOverflow: TextOverflow.ellipsis,
                      colors: Root.textcolor,
                      data: "4".tr,
                      size: Root.textsize))
            ],
          ),
        ),
        SizedBox(
            height: 220,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    item.length > 10 ? 10 : item.length,
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
            ))
      ],
    );
  }
}
