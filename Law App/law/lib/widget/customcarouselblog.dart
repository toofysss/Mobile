import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Page/blog/blogdetails.dart';
import 'package:law/class/blog.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customtext.dart';

class CustomCarouselBlog extends StatelessWidget {
  final List items;
  final int count;
  const CustomCarouselBlog(
      {required this.items, required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: count,
      itemBuilder: (context, index, realIndex) {
        var item = items[index];
        return GestureDetector(
          onTap: () {
            BlogDetailsData blogItem = BlogDetailsData.fromJson(item);
            Get.to(() => BlogDetails(item: blogItem));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.bottomRight,
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
                color: Root.primary,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: CachedNetworkImageProvider(
                      "${ApiClass.api}/BlogControll/${item['img']}",
                    ))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      bottom: 5.0,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText(
                      data: item['title'],
                      color: Colors.white,
                      size: Root.headersize,
                      textOverflow: TextOverflow.ellipsis,
                    )),
                Container(
                    margin: const EdgeInsets.only(
                      bottom: 5.0,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomText(
                      data: item['date'],
                      color: Colors.white,
                      size: Root.textsize,
                      textOverflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        height: Get.height / 4,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1,
      ),
    );
  }
}
