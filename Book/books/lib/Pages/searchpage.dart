import 'package:books/Design/favouritecard.dart';
import 'package:books/constant/home.dart';
import 'package:books/constant/data.dart';
import 'package:books/constant/root.dart';
import 'package:books/widget/customtextfield.dart';
import 'package:books/widget/customwaiting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final bool view;
  const SearchPage({required this.view, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: view
              ? AppBar(
                  elevation: 0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  leading: view
                      ? GestureDetector(
                          onTap: () {
                            HomeClass.search.clear();
                            DataClass.search.clear();
                            Get.forceAppUpdate();
                            Get.back();
                            FocusScope.of(Get.context!).unfocus();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: Root.iconsize + 2,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        )
                      : const SizedBox(),
                )
              : null,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: view ? 0 : 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomTextField(
                    controller: HomeClass.search,
                    hints: "2".tr,
                    iconData: Icons.search,
                    onTap: (s) => DataClass.searchData(HomeClass.search.text),
                  ),
                ),
                if (DataClass.search.isNotEmpty &&
                    HomeClass.search.text.isNotEmpty)
                  Center(
                    child: FavouriteCard(
                      favouriteBook: DataClass.search[0].items!,
                    ),
                  ),
                if (HomeClass.search.text.isEmpty)
                  Padding(
                    padding: EdgeInsets.only(
                      top: Get.width * .4,
                    ),
                    child: const CustomWaiting(),
                  )
              ],
            ),
          ),
        ));
  }
}
