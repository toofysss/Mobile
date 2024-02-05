import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Design/carousel.dart';
import 'package:movies_app/Design/homecard.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customloading.dart';

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
          DataClass.topratedMovie.isNotEmpty
              ? HomeCard(
                  item: DataClass.topratedMovie['results'],
                  title: "3".tr,
                  type: 'movie',
                )
              : const SizedBox(
                  height: 220,
                  child: CustomLoading(),
                ),
          // popularMovie
          DataClass.popularMovie.isNotEmpty
              ? HomeCard(
                  type: 'movie',
                  item: DataClass.popularMovie['results'],
                  title: "5".tr,
                )
              : const SizedBox(
                  height: 220,
                  child: CustomLoading(),
                ),
          // popularTv
          DataClass.popularTv.isNotEmpty
              ? HomeCard(
                  type: 'tv',
                  item: DataClass.popularTv['results'],
                  title: "6".tr,
                )
              : const SizedBox(
                  height: 220,
                  child: CustomLoading(),
                ),
          // topratedTv
          DataClass.topratedTv.isNotEmpty
              ? HomeCard(
                  type: 'tv',
                  item: DataClass.topratedTv['results'],
                  title: "7".tr,
                )
              : const SizedBox(
                  height: 220,
                  child: CustomLoading(),
                ),
        ],
      ),
    );
  }
}
