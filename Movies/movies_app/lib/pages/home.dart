import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Design/carousel.dart';
import 'package:movies_app/Design/customdesigncard.dart';
import 'package:movies_app/Design/customdetails.dart';
import 'package:movies_app/Design/morepage.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customloading.dart';
import 'package:movies_app/widget/customtext.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          // upcomingMovie
          DataClass.upcomingMovie.isNotEmpty
              ? CarouselSliders(item: DataClass.upcomingMovie['results'])
              : const SizedBox(
                  height: 220,
                  child: CustomLoading(),
                ),
          // topratedMovie
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        textOverflow: TextOverflow.ellipsis,
                        colors: Root.textcolor,
                        data: "3".tr,
                        size: Root.textsize),
                    GestureDetector(
                        onTap: () => Get.to(
                              () => CustomMorePage(
                                item: DataClass.topratedMovie['results'],
                                type: 'movie',
                                title: "3".tr,
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
              DataClass.topratedMovie.isNotEmpty
                  ? SizedBox(
                      height: 220,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              DataClass.topratedMovie['results'].length > 10
                                  ? 10
                                  : DataClass.topratedMovie['results'].length,
                              (index) => CustomDesignCard(
                                  image:
                                      '${DataClass.topratedMovie['results'][index]['poster_path']}',
                                  name:
                                      "${DataClass.topratedMovie['results'][index]['title']}",
                                  onTap: () => Get.to(() => CustomDetails(
                                        id: DataClass.topratedMovie['results']
                                            [index]['id'],
                                        type: 'movie',
                                      )),
                                  rate:
                                      "${DataClass.topratedMovie['results'][index]['vote_average']}",
                                  year:
                                      "${DateTime.parse(DataClass.topratedMovie['results'][index]['release_date']).year}")),
                        ),
                      ))
                  : const SizedBox(
                      height: 220,
                      child: CustomLoading(),
                    ),
            ],
          ),
          // popularMovie
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        textOverflow: TextOverflow.ellipsis,
                        colors: Root.textcolor,
                        data: "5".tr,
                        size: Root.textsize),
                    GestureDetector(
                        onTap: () => Get.to(
                              () => CustomMorePage(
                                title: "5".tr,
                                item: DataClass.popularMovie['results'],
                                type: 'movie',
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
              DataClass.popularMovie.isNotEmpty
                  ? SizedBox(
                      height: 220,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              DataClass.popularMovie['results'].length > 10
                                  ? 10
                                  : DataClass.popularMovie['results'].length,
                              (index) => CustomDesignCard(
                                  image:
                                      '${DataClass.popularMovie['results'][index]['poster_path']}',
                                  name:
                                      "${DataClass.popularMovie['results'][index]['title']}",
                                  onTap: () => Get.to(() => CustomDetails(
                                        id: DataClass.popularMovie['results']
                                            [index]['id'],
                                        type: 'movie',
                                      )),
                                  rate:
                                      "${DataClass.popularMovie['results'][index]['vote_average']}",
                                  year:
                                      "${DateTime.parse(DataClass.popularMovie['results'][index]['release_date']).year}")),
                        ),
                      ))
                  : const SizedBox(
                      height: 220,
                      child: CustomLoading(),
                    ),
            ],
          ),

          // popularTv
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        textOverflow: TextOverflow.ellipsis,
                        colors: Root.textcolor,
                        data: "6".tr,
                        size: Root.textsize),
                    GestureDetector(
                        onTap: () => Get.to(
                              () => CustomMorePage(
                                title: "6".tr,
                                item: DataClass.popularTv['results'],
                                type: 'tv',
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
              DataClass.popularTv.isNotEmpty
                  ? SizedBox(
                      height: 220,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              DataClass.popularTv['results'].length > 10
                                  ? 10
                                  : DataClass.popularTv['results'].length,
                              (index) => CustomDesignCard(
                                  image:
                                      '${DataClass.popularTv['results'][index]['poster_path']}',
                                  name:
                                      "${DataClass.popularTv['results'][index]['name']}",
                                  onTap: () => Get.to(() => CustomDetails(
                                        id: DataClass.popularTv['results']
                                            [index]['id'],
                                        type: 'movie',
                                      )),
                                  rate:
                                      "${DataClass.popularTv['results'][index]['vote_average']}",
                                  year:
                                      "${DateTime.parse(DataClass.popularTv['results'][index]['first_air_date']).year}")),
                        ),
                      ))
                  : const SizedBox(
                      height: 220,
                      child: CustomLoading(),
                    ),
            ],
          ),

          // topratedTv
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        textOverflow: TextOverflow.ellipsis,
                        colors: Root.textcolor,
                        data: "7".tr,
                        size: Root.textsize),
                    GestureDetector(
                        onTap: () => Get.to(
                              () =>  CustomMorePage(
                                title: "7".tr,
                                item: DataClass.topratedTv['results'],
                                type: 'tv',
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
              DataClass.topratedTv.isNotEmpty
                  ? SizedBox(
                      height: 220,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              DataClass.topratedTv['results'].length > 10
                                  ? 10
                                  : DataClass.topratedTv['results'].length,
                              (index) => CustomDesignCard(
                                  image:
                                      '${DataClass.topratedTv['results'][index]['poster_path']}',
                                  name:
                                      "${DataClass.topratedTv['results'][index]['name']}",
                                  onTap: () => Get.to(() => CustomDetails(
                                        id: DataClass.topratedTv['results']
                                            [index]['id'],
                                        type: 'movie',
                                      )),
                                  rate:
                                      "${DataClass.topratedTv['results'][index]['vote_average']}",
                                  year:
                                      "${DateTime.parse(DataClass.topratedTv['results'][index]['first_air_date']).year}")),
                        ),
                      ))
                  : const SizedBox(
                      height: 220,
                      child: CustomLoading(),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
