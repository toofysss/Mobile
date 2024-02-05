import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/services.dart';
import 'package:law/class/books.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customsearchtext.dart';

class BooksLegalWritings extends StatefulWidget {
  final List<BooksDataClass> data;
  final String title;
  const BooksLegalWritings({
    required this.data,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<BooksLegalWritings> createState() => _BooksLegalWritingsState();
}

class _BooksLegalWritingsState extends State<BooksLegalWritings> {
  @override
  void initState() {
    super.initState();
    ServicesSection.searchController.clear();
    BooksLegalWritingsClass.filteredDetails = widget.data;
  }

  List<TextSpan> highlightOccurrences(String source, String query) {
    if (query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
      return [TextSpan(text: source)];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: TextStyle(
            backgroundColor: Colors.yellow,
            color: Colors.black,
            fontSize: Root.textsize,
            fontWeight: FontWeight.bold),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.backgroundApp,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: Root.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: Root.headersize,
                ),
              ),
            ),
          ),
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustomTextSearch(
              controller: ServicesSection.searchController,
              hints: "44".tr,
              onChanged: (text) {
                setState(() {
                  BooksLegalWritingsClass.filteredDetails = widget.data
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
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                  color: Root.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Data.isSearching ? Icons.close : Icons.search,
                    size: Root.iconsSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Directionality(
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: BooksLegalWritingsClass.filteredDetails.length,
            itemBuilder: (context, index) {
              var item = BooksLegalWritingsClass.filteredDetails[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Root.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Data.urllauncher(
                            '${ApiClass.api}/BooksLegalWritings/${item.files}'),
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
                        children: highlightOccurrences(
                            item.dscrp!, ServicesSection.searchController.text),
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
      ),
    );
  }
}
