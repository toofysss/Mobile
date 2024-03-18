import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Data/api.dart';
import 'package:movies_app/widget/customloading.dart';

class CustomImage extends StatefulWidget {
  final double height;
  final String image;
  const CustomImage({required this.height, required this.image, super.key});

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CachedNetworkImage(
      imageUrl: "${Api.apiImage}${widget.image}",
      height: widget.height,
      width: Get.width,
      fit: BoxFit.fill,
      placeholder: (context, url) => const CustomLoading(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
