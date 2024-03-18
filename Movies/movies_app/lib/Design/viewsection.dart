import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Design/gridcard.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customloading.dart';
import 'package:movies_app/widget/customnotfound.dart';
import 'package:movies_app/widget/customtext.dart';

class ViewSection extends StatelessWidget {
  final String data;
  const ViewSection({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Root.appbg,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Get.back();
                DataClass.movie = {};
                DataClass.tv = {};
                Get.forceAppUpdate();
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: Root.iconsize,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            title: CustomText(
                textOverflow: TextOverflow.ellipsis,
                colors: Root.appbarcolor,
                data: data,
                size: Root.textsize),
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TabBar(
                    indicatorColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    dividerColor: Colors.transparent,
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.transparent),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Root.colorSeclectBottom,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    tabs: [
                      Tab(
                        child: CustomText(
                            colors: Colors.white,
                            data: "8".tr,
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip),
                      ),
                      Tab(
                        child: CustomText(
                            colors: Colors.white,
                            data: "9".tr,
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  DataClass.movie.isNotEmpty
                      ? DataClass.movie['results'].length == 0
                          ? const CustomNotFound()
                          : GridCard(
                              item: DataClass.movie['results'],
                              type: 'movie',
                            )
                      : const CustomLoading(),
                  DataClass.tv.isNotEmpty
                      ? DataClass.tv['results'].length == 0
                          ? const CustomNotFound()
                          : GridCard(
                              item: DataClass.tv['results'],
                            type: 'tv',
                            )
                      : const CustomLoading(),
                ]),
              ),
            ],
          )),
    );
  }
}
