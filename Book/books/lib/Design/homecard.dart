import 'package:books/Design/pagedetails.dart';
import 'package:books/class/searchingdata.dart';
import 'package:books/constant/root.dart';
import 'package:books/widget/customerror.dart';
import 'package:books/widget/customloading.dart';
import 'package:books/widget/customtext.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class BookMarkCard extends StatefulWidget {
  final List<Items> bookmarks;
  const BookMarkCard({required this.bookmarks, super.key});
  @override
  State<BookMarkCard> createState() => _BookMarkCardState();
}

class _BookMarkCardState extends State<BookMarkCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Visibility(
      visible: widget.bookmarks.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: CustomText(
                  color: Theme.of(context).focusColor,
                  size: Root.fontsize + 14,
                  data: "1".tr)),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              height: 220,
              child: Swiper(
                itemWidth: 200,
                
                layout: SwiperLayout.STACK,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Get.to(
                        () => PageDetials(data: widget.bookmarks[index])),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${widget.bookmarks[index].volumeInfo?.imageLinks!.thumbnail}",
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const CustomLoading(),
                        errorWidget: (context, url, error) =>
                            const CustomError(),
                      ),
                    ),
                  );
                },
                itemCount: widget.bookmarks.length,
                curve: Curves.easeInOut,
              ).animate(
                  delay: 800.ms,
                  effects: [FadeEffect(duration: 1000.ms)]).shimmer(
                delay: 800.ms,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
