import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/widget/customloading.dart';
import 'package:templete/widget/customtext.dart';

class ViewSection extends StatelessWidget {
  final List image;
  final String title;
  const ViewSection({required this.title, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Root.bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: CusomtText(
          data: title,
          size: Root.textsize,
          color: Root.textcolor,
        ),
      ),
      body: GridView.builder(
          itemCount: image.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 200,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () => showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: "",
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Container(),
                      transitionDuration: const Duration(milliseconds: 200),
                      transitionBuilder: (context, a1, a2, child) {
                        return ScaleTransition(
                          scale: Tween<double>(begin: .5, end: 1).animate(a1),
                          child: FadeTransition(
                            opacity:
                                Tween<double>(begin: .5, end: 1).animate(a1),
                            child: AlertDialog(
                              backgroundColor: Root.textcolor,
                              content: InteractiveViewer(
                                maxScale: 6,
                                child: CachedNetworkImage(
                                  imageUrl: image[index]['bg'],
                                  fit: BoxFit.contain,
                                  height: Get.height,
                                  width: Get.width,
                                  placeholder: (context, url) => SizedBox(
                                      height: Get.height,
                                      width: Get.width,
                                      child: const CustomLoading()),
                                ),
                              ),
                              title: Center(
                                child: GestureDetector(
                                  onTap: () => FlutterClipboard.copy(
                                          "${image[index]['dscrp']}")
                                      .then((value) => Fluttertoast.showToast(
                                              msg: "Done",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Root.bg,
                                              textColor: Root.textcolor,
                                              fontSize: 16.0)
                                          .then((value) => Get.back())),
                                  child: CusomtText(
                                      color: Root.bg,
                                      data: "${image[index]['dscrp']}",
                                      size: Root.textsize),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: CachedNetworkImage(
                    imageUrl: image[index]['bg'],
                    fit: BoxFit.contain,
                    height: 170,
                    width: 170,
                    placeholder: (context, url) => const SizedBox(
                        height: 170, width: 170, child: CustomLoading()),
                  ),
                ));
          }),
    );
  }
}
