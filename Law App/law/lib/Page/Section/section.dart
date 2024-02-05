import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/layers.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/Page/Section/layerditals.dart';
import 'package:law/Page/Section/layers.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customloading.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';
import 'package:law/widget/customtext.dart';

class Section extends StatelessWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LayersClass.getYourRightData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return const Customloading();
            }
            return Directionality(
                textDirection: LanguageClass.lang.text == "English"
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      toolbarHeight: 60,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: true,
                      title: CustomText(
                          color: Root.primary,
                          data: "34".tr,
                          size: Root.headersize,
                          textOverflow: TextOverflow.ellipsis),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            List data = [];
                            for (int i = 0; i < snapshot.data.length; i++) {
                              data.addAll(snapshot.data[i]['details']);
                            }
                            Get.to(() => Search(data: "", items: data),
                                transition: Transition.fadeIn);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Root.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.search,
                                size: Root.iconsSize,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    body: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 120,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data[index];
                          return GestureDetector(
                              onTap: () => Get.to(
                                  () => Layers(
                                      items: item['details'],
                                      data: LanguageClass.lang.text == "English"
                                          ? "${item['dscrpE']}"
                                          : "${item['dscrp']}"),
                                  transition: Transition.fadeIn),
                              child: CustomCardLaw(
                                  widget: Center(
                                child: CustomText(
                                    color: Colors.white,
                                    data: LanguageClass.lang.text == "English"
                                        ? "${item['dscrpE']}"
                                        : "${item['dscrp']}",
                                    size: Root.textsize + 5,
                                    textOverflow: TextOverflow.clip),
                              )));
                        },
                      ),
                    )));
          }
          return const Customloading();
        });
  }
}

class Search extends StatefulWidget {
  final String data;
  final List items;
  const Search({required this.data, required this.items, super.key});
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final scroll = ScrollController();

  @override
  void initState() {
    LayersClass.filteredDetails = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          backgroundColor: Root.backgroundApp,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: CustomTextSearch(
                  controller: LayersClass.searchController,
                  hints: "44".tr,
                  onChanged: (text) {
                    setState(() {
                      LayersClass.filteredDetails = widget.items
                          .where((item) => item['name']!.contains(text))
                          .toList();
                    });
                  },
                  showsearch: Data.isSearching,
                  title: widget.data),
              actions: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Data.isSearching = !Data.isSearching;
                      });
                    },
                    child: const CustomSearchButton()),
              ],
              leading: const BackPageButton()),
          body: Directionality(
            textDirection: LanguageClass.lang.text == "English"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: LayersClass.filteredDetails.length,
              itemBuilder: (context, index) {
                var item = LayersClass.filteredDetails[index];
                return GestureDetector(
                    onTap: () => Get.to(
                        () => LayerDetails(
                              item: item,
                              goverment: widget.data,
                            ),
                        transition: Transition.fadeIn),
                    child: CustomCardLaw(
                        widget: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              httpHeaders: const {"accept": "*/*"},
                              imageUrl:
                                  "${ApiClass.api}/LaweysControll/${item['img']}",
                              fit: BoxFit.fill,
                              width: 120,
                              height: 120,
                              placeholder: (context, url) => const SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: Customloading()),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: CustomText(
                                    color: Root.secondry,
                                    data: "${item['name']}",
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: CustomText(
                                    color: Root.secondry,
                                    data: "${item['depart']}",
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: CustomText(
                                    color: Root.secondry,
                                    data: "${item['dscrp']}",
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        )
                      ],
                    )));
              },
            ),
          )),
    );
  }
}
