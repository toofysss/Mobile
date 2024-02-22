import 'package:books/Pages/searchpage.dart';
import 'package:books/constant/data.dart';
import 'package:books/constant/home.dart';
import 'package:books/constant/root.dart';
import 'package:books/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  final List<CategoryClass> category;
  const Category({required this.category, super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomText(
                  color: Theme.of(context).focusColor,
                  size: Root.fontsize + 14,
                  data: "14".tr)),
          SizedBox(
            height: 250,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  3,
                  (rowIndex) {
                    int count = (category.length / 3).ceil();
                    int startIndex = rowIndex * count;
                    int endIndex = (rowIndex + 1) * count;
                    endIndex =
                        endIndex > category.length ? category.length : endIndex;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        endIndex - startIndex,
                        (index) => GestureDetector(
                          onTap: () {
                            DataClass.searchData(HomeClass.search.text);
                            HomeClass.search.text =
                                category[startIndex + index].title;
                            Get.to(
                              () => const SearchPage(
                                view: true,
                              ),
                              transition: Transition.fadeIn,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(29),
                              border: Border.all(
                                  color: Theme.of(context).cardColor),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  blurRadius: 5,
                                  color: Theme.of(context).shadowColor,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  category[startIndex + index].iconData,
                                  size: Root.iconsize,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                const SizedBox(width: 10),
                                CustomText(
                                  color: Theme.of(context).focusColor,
                                  size: Root.fontsize + 5,
                                  data: category[startIndex + index].title,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      );
}
