import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/blog.dart';
import 'package:law/contant/config.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customloading.dart';
import 'package:law/widget/customtext.dart';

class BlogDetails extends StatelessWidget {
  final BlogDetailsData item;
  const BlogDetails({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: const BackPageButton()),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomCardLaw(
              widget: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Config.api}/BlogControll/${item.img}",
                            httpHeaders: const {"accept": "*/*"},
                            fit: BoxFit.fill,
                            width: 250,
                            height: 250,
                            placeholder: (context, url) => const SizedBox(
                                width: 250,
                                height: 250,
                                child: Customloading()),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Theme.of(context).focusColor,
                          data: "${item.title}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      width: Get.width,
                      height: 400,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).indicatorColor,
                        border: Border.all(width: 1.5, color: Theme.of(context).indicatorColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: CustomText(
                            color: Colors.black,
                            data: "${item.dscrp}",
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
