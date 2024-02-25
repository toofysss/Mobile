import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/widget/customloading.dart';
import 'package:templete/widget/customtext.dart';

class EditData extends StatelessWidget {
  final String hint;
  const EditData({required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          backgroundColor: Root.bg,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: CusomtText(
              data: hint,
              size: Root.textsize,
              color: Root.textcolor,
            ),
          ),
          body: SizedBox(
            width: Get.width,
            child: Directionality(
              textDirection: LanguageClass.lang.text == "English"
                  ? TextDirection.rtl
                  : TextDirection.rtl,
              child: FutureBuilder(
                future: Data.getdata(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              List.generate(snapshot.data.length, (index) {
                            String section = snapshot.data[index]['section'];
                            var images = snapshot.data[index]['notes'];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 25),
                                  child: CusomtText(
                                      color: Root.textcolor,
                                      data: section,
                                      size: Root.textsize),
                                ),
                                SizedBox(
                                  height: 250,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      itemBuilder: (context, imageIndex) {
                                        return GestureDetector(
                                            onTap: () => showGeneralDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  barrierLabel: "",
                                                  pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) =>
                                                      Container(),
                                                  transitionDuration:
                                                      const Duration(
                                                          milliseconds: 200),
                                                  transitionBuilder:
                                                      (context, a1, a2, child) {
                                                    return ScaleTransition(
                                                      scale: Tween<double>(
                                                              begin: .5, end: 1)
                                                          .animate(a1),
                                                      child: FadeTransition(
                                                        opacity: Tween<double>(
                                                                begin: .5,
                                                                end: 1)
                                                            .animate(a1),
                                                        child: AlertDialog(
                                                          shadowColor:
                                                              Colors.red,
                                                          elevation: 4,
                                                          shape: RoundedRectangleBorder(
                                                              side: const BorderSide(
                                                                  width: .5,
                                                                  color: Colors
                                                                      .red),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          backgroundColor:
                                                              Root.textcolor,
                                                          title: Center(
                                                            child: CusomtText(
                                                                color: Root.bg,
                                                                data: "18".tr,
                                                                size: Root
                                                                    .textsize),
                                                          ),
                                                          content: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        8.0),
                                                                child: Center(
                                                                  child: CusomtText(
                                                                      color: Root
                                                                          .bg,
                                                                      data: "20"
                                                                          .tr,
                                                                      size: Root
                                                                          .textsize),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        8.0),
                                                                child: Center(
                                                                  child: CusomtText(
                                                                      color: Root
                                                                          .bg,
                                                                      data: "21"
                                                                          .tr,
                                                                      size: Root
                                                                          .textsize),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            8),
                                                                child: Center(
                                                                  child: CusomtText(
                                                                      color: Root
                                                                          .primary,
                                                                      data:
                                                                          "${images[imageIndex]['dscrp']}",
                                                                      size: Root
                                                                          .textsize),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  OperationClass
                                                                          .sectionID =
                                                                      images[imageIndex]
                                                                          [
                                                                          'id'];
                                                                  OperationClass
                                                                      .dataoperation(
                                                                          true);
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 50,
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    vertical: 5,
                                                                  ),
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          30,
                                                                      vertical:
                                                                          5),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    color: Colors
                                                                        .red
                                                                        .withOpacity(
                                                                            .85),
                                                                  ),
                                                                  child: Center(
                                                                    child: CusomtText(
                                                                        color: Colors
                                                                            .white,
                                                                        data: "19"
                                                                            .tr,
                                                                        size: Root
                                                                            .textsize),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: CachedNetworkImage(
                                                imageUrl: images[imageIndex]
                                                    ['bg'],
                                                fit: BoxFit.fill,
                                                height: 170,
                                                width: 170,
                                                placeholder: (context, url) =>
                                                    const SizedBox(
                                                        height: 170,
                                                        width: 170,
                                                        child:
                                                            CustomLoading()), // You can customize the placeholder
                                              ),
                                            ));
                                      }),
                                )
                              ],
                            );
                          })),
                    );
                  }
                  return const CustomLoading();
                },
              ),
            ),
          )),
    );
  }
}
