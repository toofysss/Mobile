import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gcc/constant/blog.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/widget/customloading.dart';
import 'package:gcc/widget/errorMessage.dart';
import 'package:get/get.dart';

class GetBlog extends StatefulWidget {
  const GetBlog({Key? key}) : super(key: key);

  @override
  State<GetBlog> createState() => _GetBlogState();
}

class _GetBlogState extends State<GetBlog> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlogClass.getblog(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return ErrorMessage(
            subtitle: "25".tr,
            title: "24".tr,
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length == 0) {
            return SizedBox(
                width: Get.width, height: 200, child: const CustomLoading());
          }
        }

        // جلب البيانات
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            const SizedBox();
          }
          return Container(
            margin: const EdgeInsets.only(top: 10),
            height: BlogClass.heightCarousel,
            child: Column(
              children: List.generate(1, (index) {
                return Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          BlogClass.currentIndex = index;
                        });
                      },
                      child: CarouselSlider(
                        items: snapshot.data
                            .map<Widget>((item) => ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    item['image'],
                                    fit: BoxFit.fill,
                                    width: Get.width,
                                    height: Get.height,
                                  ),
                                ))
                            .toList(),
                        carouselController: BlogClass.carouselController,
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 7,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              BlogClass.currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            snapshot.data.asMap().entries.map<Widget>((entry) {
                          return GestureDetector(
                            onTap: () => BlogClass.carouselController
                                .animateToPage(entry.key),
                            child: Container(
                              width:
                                  BlogClass.currentIndex == entry.key ? 17 : 7,
                              height: 7.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: BlogClass.currentIndex == entry.key
                                    ? ColorsClass.selectcolor
                                    : ColorsClass.unselectColor,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          //  واجهة الانتظار
          return SizedBox(
              width: Get.width, height: 200, child: const CustomLoading());
        }

        //  واجهة الانتظار
        return SizedBox(
            width: Get.width, height: 200, child: const CustomLoading());
      },
    );
  }
}
