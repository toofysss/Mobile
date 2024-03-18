import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movies_app/Data/api.dart';
import 'package:movies_app/Data/home.dart';
import 'package:movies_app/widget/customimage.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customloading.dart';
import 'package:movies_app/widget/customtext.dart';

class CustomDetails extends StatelessWidget {
  final String type;
  final int id;
  const CustomDetails({required this.id, required this.type, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Root.appbg,
      child: FutureBuilder(
          future: HomeClass.details("$id", type),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var item = snapshot.data['Data'];
              var video = snapshot.data['video']['results'][0]['key'];

              String year = item['first_air_date'] != null
                  ? "${DateTime.parse(item['first_air_date']).year}"
                  : "${DateTime.parse(item['release_date']).year}";

              String doubleValue = "${item['vote_average']}";
              return Scaffold(
                backgroundColor: Root.appbg,
                body: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: CustomImage(
                            height: Get.height * .35,
                            image: "${Api.apiImage}${item['backdrop_path']}")),
                    Positioned(
                        top: 20,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.white.withOpacity(.13)),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Root.appbg.withOpacity(.90),
                                  Root.appbg.withOpacity(.90),
                                ],
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: Root.iconsize,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: Get.width,
                        color: Root.appbg,
                        height: Get.height * .65,
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              height: Get.height - 350,
                              width: Get.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white.withOpacity(.13)),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(.06),
                                    Colors.white.withOpacity(.05),
                                  ],
                                ),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CustomText(
                                              textOverflow: TextOverflow.clip,
                                              colors: Root.textcolor,
                                              data:
                                                  "${item['name'] ?? item['title']}",
                                              size: Root.textsize + 5,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => HomeClass.urllauncher(
                                                "https://youtu.be/$video"),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomText(
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  colors: Root.textcolor,
                                                  data: "Trailer",
                                                  size: Root.textsize,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: Icon(
                                                    FontAwesomeIcons.youtube,
                                                    color: Colors.red,
                                                    size: Root.iconsize,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CustomText(
                                              textOverflow: TextOverflow.clip,
                                              colors: Root.textcolor,
                                              data: " $year",
                                              size: Root.textsize,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                colors: Root.textcolor,
                                                data: " $doubleValue",
                                                size: Root.textsize,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: Root.iconsize,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),

                                    // section
                                    Wrap(
                                      children: List.generate(
                                          item['genres'].length,
                                          (index) => Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2,
                                                        vertical: 5),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 15),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1.5,
                                                      color: Colors.white
                                                          .withOpacity(.3)),
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: CustomText(
                                                    colors: Root.textcolor,
                                                    data: item['genres'][index]
                                                        ['name'],
                                                    size: Root.textsize,
                                                    textOverflow:
                                                        TextOverflow.clip),
                                              )),
                                    ),

                                    // overflow
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: CustomText(
                                        textOverflow: TextOverflow.clip,
                                        colors: Root.textcolor,
                                        data: "${item['overview']}",
                                        size: Root.textsize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return const CustomLoading();
          }),
    );
  }
}
