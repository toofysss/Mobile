import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/services.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/books.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';

class Books extends StatefulWidget {
  final List<BooksDataClass> data;
  final String title;
  const Books({required this.data, required this.title, Key? key})
      : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  void initState() {
    super.initState();
    ServicesSection.searchController.clear();
    BooksClass.filteredDetails = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Root.backgroundApp,
          appBar: AppBar(
            leading: const BackPageButton(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: CustomTextSearch(
                controller: ServicesSection.searchController,
                hints: "44".tr,
                onChanged: (text) {
                  setState(() {
                    BooksClass.filteredDetails = widget.data
                        .where((item) => item.dscrp!.contains(text))
                        .toList();
                  });
                },
                showsearch: Data.isSearching,
                title: widget.title),
            actions: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      Data.isSearching = !Data.isSearching;
                    });
                  },
                  child: const CustomSearchButton()),
            ],
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: BooksClass.filteredDetails.length,
              itemBuilder: (context, index) {
                var item = BooksClass.filteredDetails[index];
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
                                color: Colors.white),
                            child: Icon(
                              FontAwesomeIcons.download,
                              size: Root.iconsSize + 5,
                              color: Root.primary,
                            ),
                          ),
                        ),
                      ),
                      SelectableText.rich(
                        TextSpan(
                          children: Data.highlightOccurrences(item.dscrp!,
                              ServicesSection.searchController.text),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Root.textsize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
