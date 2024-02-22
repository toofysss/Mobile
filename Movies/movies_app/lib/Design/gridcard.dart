import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Design/customdetails.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customimage.dart';
import 'package:movies_app/widget/customtext.dart';

class GridCard extends StatelessWidget {
  final List item;
  final String type;
  const GridCard({required this.item, required this.type, super.key});

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
        itemBuilder: (context, index) => GestureDetector(
              onTap: () => Get.to(
                () => CustomDetails(
                  id: item[index]['id'],
                  type: type,
                ),
              ),
              child: Container(
                width: 150,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(.13)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(.15),
                      Colors.white.withOpacity(.05),
                    ],
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CustomImage(
                            height: 150,
                            image: '${item[index]['poster_path']}')),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CustomText(
                          textOverflow: TextOverflow.ellipsis,
                          colors: Root.textcolor,
                          data:
                              "${item[index]['name'] ?? item[index]['title']}",
                          size: Root.textsize - 3),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                textOverflow: TextOverflow.ellipsis,
                                colors: Root.textcolor,
                                data: item[index]['first_air_date'] != null
                                    ? "${DateTime.parse(item[index]['first_air_date']).year}"
                                    : "${DateTime.parse(item[index]['release_date']).year}",
                                size: Root.textsize - 3),
                            Row(
                              children: [
                                CustomText(
                                    textOverflow: TextOverflow.ellipsis,
                                    colors: Root.textcolor,
                                    data: "${item[index]['vote_average']}",
                                    size: Root.textsize - 3),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: Root.iconsize,
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ));
  }
}
