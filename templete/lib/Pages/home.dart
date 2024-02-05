import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/widget/customloading.dart';
import 'package:templete/widget/customtext.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     if (Data.json.isNotEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(Data.json.length, (index) {
              String section = Data.json[index]['section'];
              var images = Data.json[index]['notes'];
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              images.length,
                              (imageIndex) => GestureDetector(
                                  onTap: () => showGeneralDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        barrierLabel: "",
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            Container(),
                                        transitionDuration:
                                            const Duration(milliseconds: 200),
                                        transitionBuilder:
                                            (context, a1, a2, child) {
                                          return ScaleTransition(
                                            scale:
                                                Tween<double>(begin: .5, end: 1)
                                                    .animate(a1),
                                            child: FadeTransition(
                                              opacity: Tween<double>(
                                                      begin: .5, end: 1)
                                                  .animate(a1),
                                              child: AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                backgroundColor: Root.textcolor,
                                                content: InteractiveViewer(
                                                  maxScale: 6,
                                                  child: CachedNetworkImage(
                                                    imageUrl: images[imageIndex]
                                                        ['bg'],
                                                    fit: BoxFit.contain,
                                                    height: Get.height,
                                                    width: Get.width,
                                                    placeholder: (context,
                                                            url) =>
                                                        SizedBox(
                                                            height: Get.height,
                                                            width: Get.width,
                                                            child:
                                                                const CustomLoading()),
                                                  ),
                                                ),
                                                title: Center(
                                                  child: GestureDetector(
                                                    onTap: () => FlutterClipboard
                                                            .copy(
                                                                "${images[imageIndex]['dscrp']}")
                                                        .then((value) => Fluttertoast.showToast(
                                                                msg: "Done",
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .BOTTOM,
                                                                timeInSecForIosWeb:
                                                                    1,
                                                                backgroundColor:
                                                                    Root.bg,
                                                                textColor: Root
                                                                    .textcolor,
                                                                fontSize: 16.0)
                                                            .then((value) =>
                                                                Get.back())),
                                                    child: CusomtText(
                                                        color: Root.bg,
                                                        data:
                                                            "${images[imageIndex]['dscrp']}",
                                                        size: Root.textsize),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: CachedNetworkImage(
                                      imageUrl: images[imageIndex]['bg'],
                                      fit: BoxFit.contain,
                                      height: 170,
                                      width: 170,
                                      errorWidget: (context, url, error) =>
                                          const SizedBox(),
                                      placeholder: (context, url) =>
                                          const SizedBox(
                                              height: 170,
                                              width: 170,
                                              child: CustomLoading()),
                                    ),
                                  ))),
                        ),
                      ))
                ],
              );
            })),
      );
    }
    return const CustomLoading();
  }
}
