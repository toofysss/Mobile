import 'package:books/Design/pagedetails.dart';
import 'package:books/class/searchingdata.dart';
import 'package:books/constant/root.dart';
import 'package:books/widget/customimage.dart';
import 'package:books/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteCard extends StatelessWidget {
  final List<Items> favouriteBook;
  const FavouriteCard({required this.favouriteBook, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        favouriteBook.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 230,
          width: 350,
          child: Stack(children: [
            // Card
            Positioned(
              bottom: 0,
              left: 25,
              right: 0,
              child: Container(
                  height: 200,
                  // width: 250,
                  decoration: BoxDecoration(
                                 color: Theme.of(context).colorScheme.secondary,

                    borderRadius: BorderRadius.circular(29),
                    border: Border.all(color: Theme.of(context).cardColor),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 5,
                        color: Theme.of(context).shadowColor,
                      ),
                    ],
                  )),
            ),
            // Img
            if (favouriteBook[index].volumeInfo?.imageLinks?.thumbnail != null)
              Positioned(
                  left: 0,
                  child: CustomImage(
                    image:
                        "${favouriteBook[index].volumeInfo?.imageLinks?.thumbnail}",
                    hieght: 200,
                    width: 150,
                  )),

            Positioned(
              top: 50,
              left: 160,
              child: SizedBox(
                width: 170,
                child: RichText(
                  maxLines: 5,
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).focusColor,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "${favouriteBook[index].volumeInfo?.title}\n",
                        style: TextStyle(
                            fontSize: 15.5,
                            color: Theme.of(context).focusColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: (favouriteBook.isNotEmpty &&
                                  index < favouriteBook.length)
                              ? (favouriteBook[index].volumeInfo?.authors !=
                                          null &&
                                      favouriteBook[index]
                                          .volumeInfo!
                                          .authors!
                                          .isNotEmpty
                                  ? favouriteBook[index]
                                      .volumeInfo!
                                      .authors!
                                      .join(', ')
                                  : '')
                              : '',
                          style: TextStyle(
                              fontSize: 14,
                              color: ThemeDataClass.grey,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 30,
                left: 160,
                child: Center(
                  child: GestureDetector(
                    onTap: () =>
                        Get.to(() => PageDetials(data: favouriteBook[index])),
                    child: Container(
                        width: 170,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).indicatorColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: CustomText(
                            color: Theme.of(context).primaryColor,
                            size: 16,
                            data: "3".tr)),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
