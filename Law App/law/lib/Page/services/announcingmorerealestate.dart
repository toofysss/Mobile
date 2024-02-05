import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/services.dart';
import 'package:law/class/announcingmorerealestate.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/customloading.dart';
import 'package:law/widget/customsearchtext.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class AnnouncingMoreRealEstate extends StatefulWidget {
  final List<AnnouncingMoreRealEstateData> data;
  final String title;
  const AnnouncingMoreRealEstate(
      {required this.data, required this.title, Key? key})
      : super(key: key);
  @override
  State<AnnouncingMoreRealEstate> createState() =>
      _AnnouncingMoreRealEstateState();
}

class _AnnouncingMoreRealEstateState extends State<AnnouncingMoreRealEstate> {
  @override
  void initState() {
    super.initState();
    ServicesSection.searchController.clear();
    AnnouncingMoreRealEstateClass.filteredDetails = widget.data;
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
                    AnnouncingMoreRealEstateClass.filteredDetails = widget.data
                        .where((item) => item.lawname!.contains(text))
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
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
              GestureDetector(
                onTap: () async {
                  if (Data.laweysID.text.isEmpty) {
                    return AlertClass.success("108".tr);
                  }
                  Get.to(() => const AnnouncingMoreRealEstateAdd(),
                      transition: Transition.fadeIn);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Root.primary,
                      shape: BoxShape.circle),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    size: Root.iconsSize,
                  )),
                ),
              ),
            ],
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                    AnnouncingMoreRealEstateClass.filteredDetails.length,
                    (index) {
                  var item =
                      AnnouncingMoreRealEstateClass.filteredDetails[index];
                  return GestureDetector(
                    onTap: () => Get.to(
                        () => AnnouncingMoreRealEstateDetails(item: item),
                        transition: Transition.fadeIn),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      color: Root.primary,
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${ApiClass.api}/AnnouncingMoreRealEstate/${item.img}",
                                fit: BoxFit.fill,
                                httpHeaders: const {"accept": "*/*"},
                                width: 150,
                                height: 150,
                                placeholder: (context, url) => const SizedBox(
                                    width: 150,
                                    height: 150,
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
                                      vertical: 15, horizontal: 5),
                                  child: CustomText(
                                      color: Root.secondry,
                                      data: "${item.lawname}",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.ellipsis),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  child: CustomText(
                                      color: Root.secondry,
                                      data: "${item.date}",
                                      size: Root.textsize - 2,
                                      textOverflow: TextOverflow.ellipsis),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ));
  }
}

class AnnouncingMoreRealEstateDetails extends StatelessWidget {
  final AnnouncingMoreRealEstateData item;
  const AnnouncingMoreRealEstateDetails({required this.item, super.key});

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
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
               color: Root.primary,
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${ApiClass.api}/AnnouncingMoreRealEstate/${item.img}",
                            httpHeaders: const {"accept": "*/*"},
                            fit: BoxFit.fill,
                            width: 250,
                            height: 250,
                            placeholder: (context, url) => const SizedBox(
                                width: 250,
                                height: 250,
                                child: Customloading()),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.secondry,
                          data: "${"167".tr} : ${item.lawname}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.secondry,
                          data: "${"168".tr} : ${item.type}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.secondry,
                          data: "${"169".tr} : ${item.owners}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.secondry,
                          data: "${"170".tr} : ${item.space}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.secondry,
                          data: "${"171".tr} : ${item.address}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.secondry,
                          data: "${"172".tr} : ${item.price}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.secondry,
                          data: "${"173".tr} : ${item.date}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                        width: Get.width,
                        height: 400,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Root.backgroundApp,
                          border:
                              Border.all(width: 1.5, color: Root.secondry),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: CustomText(
                                    color: Colors.black,
                                    data: "${item.dscrp}",
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip),
                              ),
                            )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class AnnouncingMoreRealEstateAdd extends StatelessWidget {
  const AnnouncingMoreRealEstateAdd({super.key});

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
            title: CustomText(
                color: Root.primary,
                data: "157".tr,
                size: Root.headersize,
                textOverflow: TextOverflow.clip),
            leading: GestureDetector(
              onTap: () {
                AnnouncingMoreRealEstateClass.clear();
                Get.back();
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
                    Icons.arrow_back_ios_new,
                    size: Root.headersize,
                  ),
                ),
              ),
            ),
          ),
          body: Directionality(
            textDirection: LanguageClass.lang.text == "English"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AnnouncingMoreRealEstateClass.img != null
                          ? GestureDetector(
                              onTap: () =>
                                  AnnouncingMoreRealEstateClass.pickfile(),
                              child: Container(
                                width: Get.width * .8,
                                height: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: FileImage(
                                            AnnouncingMoreRealEstateClass.img!),
                                        fit: BoxFit.fill)),
                              ),
                            )
                          : Container(
                              width: Get.width * .8,
                              height: 350,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: GestureDetector(
                                onTap: () =>
                                    AnnouncingMoreRealEstateClass.pickfile(),
                                child: Center(
                                  child: CustomText(
                                      color: Root.primary,
                                      data: "174".tr,
                                      size: Root.headersize,
                                      textOverflow: TextOverflow.clip),
                                ),
                              ),
                            ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          maxlength: 150,
                          textInputType: TextInputType.name,
                          controller: AnnouncingMoreRealEstateClass.lawname,
                          hints: "167".tr,
                          maxline: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.name,
                          controller: AnnouncingMoreRealEstateClass.type,
                          hints: "168".tr,
                          maxline: 1,
                          maxlength: 5000,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.name,
                          controller: AnnouncingMoreRealEstateClass.owners,
                          hints: "169".tr,
                          maxline: 1,
                          maxlength: 5000,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.name,
                          controller: AnnouncingMoreRealEstateClass.space,
                          hints: "170".tr,
                          maxline: 1,
                          maxlength: 5000,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.name,
                          controller: AnnouncingMoreRealEstateClass.address,
                          hints: "171".tr,
                          maxline: 1,
                          maxlength: 5000,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.name,
                          controller: AnnouncingMoreRealEstateClass.price,
                          hints: "172".tr,
                          maxline: 1,
                          maxlength: 5000,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.name,
                          controller: AnnouncingMoreRealEstateClass.date,
                          hints: "173".tr,
                          maxline: 1,
                          maxlength: 5000,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.name,
                          controller: AnnouncingMoreRealEstateClass.dscrp,
                          hints: "175".tr,
                          maxline: 7,
                          maxlength: 5000,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: GestureDetector(
                            onTap: () => AnnouncingMoreRealEstateClass.send(),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              color: Root.primary,
                              ),
                              width: Get.width * .8,
                              child: Center(
                                child: CustomText(
                                    color: Colors.white,
                                    data: "91".tr,
                                    size: Root.headersize,
                                    textOverflow: TextOverflow.clip),
                              ),
                            ),
                          ))
                    ]),
              ),
            ),
          ),
        ));
  }
}
