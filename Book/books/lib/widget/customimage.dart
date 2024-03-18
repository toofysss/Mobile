import 'package:books/widget/customerror.dart';
import 'package:books/widget/customloading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomImage extends StatefulWidget {
  final String image;
  final double hieght;
  final double width;
  const CustomImage(
      {required this.hieght,
      required this.width,
      required this.image,
      super.key});
  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: widget.image,
        height: widget.hieght,
        fit: BoxFit.fill,
        width: widget.width,
        placeholder: (context, url) => const CustomLoading(),
        errorWidget: (context, url, error) => const CustomError(),
      ),
    ).animate(delay: 800.ms, effects: [FadeEffect(duration: 1000.ms)]).shimmer(
      delay: 800.ms,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
