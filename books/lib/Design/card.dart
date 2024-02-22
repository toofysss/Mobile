import 'package:books/Design/pagedetails.dart';
import 'package:books/class/searchingdata.dart';
import 'package:books/constant/root.dart';
import 'package:books/widget/customimage.dart';
import 'package:books/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListCard extends StatelessWidget {
  final List<SearchingData> item;
  final String header;
  const CustomListCard({required this.header, required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: CustomText(
                color: Theme.of(context).focusColor,
                size: Root.fontsize + 14,
                data: header)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
                children: List.generate(
                    item[0].items!.length > 10 ? 10 : item[0].items!.length,
                    (index) => Container(
                          margin: const EdgeInsets.only(left: 15, bottom: 40),
                          height: 290,
                          width: 210,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Stack(
                              children: <Widget>[
                                // Card
                                Positioned(
                                  bottom: 0,
                                  left: 10,
                                  right: 0,
                                  child: Container(
                                      height: 240,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        borderRadius: BorderRadius.circular(29),
                                        border: Border.all(
                                            color: Theme.of(context).cardColor),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 10),
                                            blurRadius: 5,
                                            color:
                                                Theme.of(context).shadowColor,
                                          ),
                                        ],
                                      )),
                                ),

                                // Img
                                CustomImage(
                                  image:
                                      "${item[0].items![index].volumeInfo?.imageLinks?.thumbnail}",
                                  hieght: 170,
                                  width: 130,
                                ),

                                // Text +button
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: SizedBox(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 24, bottom: 10),
                                          child: RichText(
                                            maxLines: 3,
                                            text: TextSpan(
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                  fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "${item[0].items![index].volumeInfo?.title}\n",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Theme.of(context)
                                                          .focusColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                TextSpan(
                                                    text:
                                                        "${item[0].items![index].volumeInfo?.authors}",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            ThemeDataClass.grey,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            const SizedBox(
                                              width: 101,
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () => Get.to(
                                                    () => PageDetials(
                                                        data: item[0]
                                                            .items![index]),
                                                    transition:
                                                        Transition.fadeIn),
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .indicatorColor,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(26),
                                                        bottomRight:
                                                            Radius.circular(26),
                                                      ),
                                                    ),
                                                    child: CustomText(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        size: 16,
                                                        data: "3".tr)),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))),
          ),
        ),
      ],
    );
  }
}
