import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/widget/customimage.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customtext.dart';
import 'package:movies_app/Design/customdetails.dart';

class CarouselSliders extends StatelessWidget {
  final List item;
  const CarouselSliders({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 5,
        options: CarouselOptions(
          height: 220,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.easeInOut,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1500),
          viewportFraction: 1,
        ),
        itemBuilder: (context, index, realIndex) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                CustomImage(
                    height: Get.height, image: item[index]['backdrop_path']),
                Positioned(
                    bottom: 15,
                    child: GestureDetector(
                      onTap: () => Get.to(() => CustomDetails(
                            id: item[index]['id'],
                            type: 'movie',
                          )),
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Root.colorSeclectBottom,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                size: Root.iconsize,
                                color: Colors.white,
                              ),
                              CustomText(
                                  textOverflow: TextOverflow.ellipsis,
                                  colors: Root.textcolor,
                                  data: "2".tr,
                                  size: Root.textsize),
                            ],
                          )),
                    ))
              ],
            ),
          );
        });
  }
}
