import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/Page/blog/blogdetails.dart';
import 'package:law/class/blog.dart';
import 'package:law/contant/config.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customloading.dart';
import 'package:law/widget/customtext.dart';

class CustomBlogCard extends StatelessWidget {
  final BlogDetailsData blogItem;
  const CustomBlogCard({required this.blogItem, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => BlogDetails(item: blogItem),
          transition: Transition.fadeIn),
      child: CustomCardLaw(
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: "${Config.api}/BlogControll/${blogItem.img}",
                  fit: BoxFit.fill,
                  httpHeaders: const {"accept": "*/*"},
                  width: 150,
                  height: 150,
                  placeholder: (context, url) => const SizedBox(
                      width: 150, height: 150, child: Customloading()),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    child: CustomText(
                        color: Root.secondry,
                        data: "${blogItem.title}",
                        size: Root.textsize,
                        textOverflow: TextOverflow.ellipsis),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    child: CustomText(
                        color: Root.secondry,
                        data: "${blogItem.date}",
                        size: Root.textsize - 2,
                        textOverflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
