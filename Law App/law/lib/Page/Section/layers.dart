// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:law/Data/homescreen.dart';
// import 'package:law/Desing/customcard.dart';
// import 'package:law/Page/Section/layerditals.dart';
// import 'package:law/contant/api.dart';
// import 'package:law/contant/root.dart';
// import 'package:law/widget/backbutton.dart';
// import 'package:law/widget/customloading.dart';
// import 'package:law/widget/customsearchbutton.dart';
// import 'package:law/widget/customsearchtext.dart';
// import 'package:law/widget/customtext.dart';

class Layers extends StatelessWidget {
  final int id;
  final String data;
  const Layers({required this.id, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    // return Scaffold(
    //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //   appBar: AppBar(
    //       elevation: 0,
    //       backgroundColor: Colors.transparent,
    //       centerTitle: true,
    //       title: CustomTextSearch(
    //           controller: LayersClass.searchController,
    //           hints: "44".tr,
    //           onChanged: (text) {
    //             // LayersClass.filteredDetails = widget.items
    //             //     .where((item) => item['name']!.contains(text))
    //             //     .toList();
    //             Get.forceAppUpdate();
    //           },
    //           showsearch: Data.isSearching,
    //           title: data),
    //       actions: [
    //         GestureDetector(
    //             onTap: () {
    //               Data.isSearching = !Data.isSearching;
    //               Get.forceAppUpdate();
    //             },
    //             child: const CustomSearchButton()),
    //       ],
    //       leading: const BackPageButton()),
    //   body: ListView.builder(
    //     physics: const BouncingScrollPhysics(),
    //     shrinkWrap: true,
    //     scrollDirection: Axis.vertical,
    //     itemCount: LayersClass.filteredDetails.length,
    //     itemBuilder: (context, index) {
    //       var item = LayersClass.filteredDetails[index];
    //       return GestureDetector(
    //           onTap: () => Get.to(
    //               () => LayerDetails(
    //                     item: item,
    //                     goverment: data,
    //                   ),
    //               transition: Transition.fadeIn),
    //           child: CustomCardLaw(
    //               widget: Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(10),
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(15),
    //                   child: CachedNetworkImage(
    //                     httpHeaders: const {"accept": "*/*"},
    //                     imageUrl:
    //                         "${ApiClass.api}/LaweysControll/${item['img']}",
    //                     fit: BoxFit.fill,
    //                     width: 120,
    //                     height: 120,
    //                     placeholder: (context, url) => const SizedBox(
    //                         width: 120, height: 120, child: Customloading()),
    //                   ),
    //                 ),
    //               ),
    //               Expanded(
    //                 flex: 2,
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Container(
    //                       margin: const EdgeInsets.symmetric(
    //                           vertical: 5, horizontal: 5),
    //                       child: CustomText(
    //                           color: Root.secondry,
    //                           data: "${item['name']}",
    //                           size: Root.textsize,
    //                           textOverflow: TextOverflow.ellipsis),
    //                     ),
    //                     Container(
    //                       margin: const EdgeInsets.symmetric(
    //                           vertical: 5, horizontal: 5),
    //                       child: CustomText(
    //                           color: Root.secondry,
    //                           data: "${item['depart']}",
    //                           size: Root.textsize,
    //                           textOverflow: TextOverflow.ellipsis),
    //                     ),
    //                     Container(
    //                       margin: const EdgeInsets.symmetric(
    //                           vertical: 5, horizontal: 5),
    //                       child: CustomText(
    //                           color: Root.secondry,
    //                           data: "${item['dscrp']}",
    //                           size: Root.textsize,
    //                           textOverflow: TextOverflow.ellipsis),
    //                     ),
    //                   ],
    //                 ),
    //               )
    //             ],
    //           )));
    //     },
    //   ),
    // );
  }
}
