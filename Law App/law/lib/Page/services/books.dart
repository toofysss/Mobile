import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/books.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';

class BookController extends GetxController {
  List<BooksDataClass> filteredDetails = [];
  TextEditingController searchController = TextEditingController();
  void setData(Books contract) {
    filteredDetails = contract.data;
    update();
  }

  void search(String text, Books contract) {
    filteredDetails = contract.data
        .where((e) => e.dscrp!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    update();
  }
}

class Books extends StatelessWidget {
  final List<BooksDataClass> data;
  final String title;
  const Books({required this.data, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    BookController controller = Get.put(BookController());
    controller.setData(this);
    return GetBuilder<BookController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              leading: const BackPageButton(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: SizedBox(
                width: Get.width * (Data.isSearching ? 0.8 : 0.0),
                child: CustomTextSearch(
                    controller: controller.searchController,
                    hints: "44".tr,
                    onChanged: (text) => controller.search(text, this),
                    showsearch: Data.isSearching,
                    title: title),
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      Data.isSearching = !Data.isSearching;
                      Get.forceAppUpdate();
                    },
                    child: const CustomSearchButton()),
              ],
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.filteredDetails.length,
              itemBuilder: (context, index) {
                var item = controller.filteredDetails[index];
                return CustomCardLaw(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Data.urllauncher(item.files!),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Theme.of(context).primaryColor),
                            child: Icon(
                              FontAwesomeIcons.download,
                              size: Root.iconsSize + 5,
                              color: Theme.of(context).indicatorColor,
                            ),
                          ),
                        ),
                      ),
                      SelectableText.rich(
                        TextSpan(
                          children: Data.highlightOccurrences(
                              item.dscrp!, controller.searchController.text),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: Root.textsize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
