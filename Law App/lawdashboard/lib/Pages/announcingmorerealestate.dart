import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Data/homescreen.dart';
import 'package:lawdashboard/constant/api.dart';
import 'package:lawdashboard/constant/root.dart';
import 'package:lawdashboard/widget/customappbar.dart';
import 'package:lawdashboard/widget/customback.dart';
import 'package:lawdashboard/widget/custombutton.dart';
import 'package:lawdashboard/widget/customloading.dart';
import 'package:lawdashboard/widget/customnonotes.dart';
import 'package:lawdashboard/widget/customsearchtext.dart';
import 'package:lawdashboard/widget/customtext.dart';
import 'package:lawdashboard/widget/customtextfield.dart';

getdata() async {
  Data.listData.clear();
  Data.clear();
  Data.listData = await Data.getData("AnnouncingMoreRealEstate/Get");
  Get.forceAppUpdate();
}

class AnnouncingMoreRealEstate extends StatefulWidget {
  final String title;
  const AnnouncingMoreRealEstate({required this.title, super.key});

  @override
  State<AnnouncingMoreRealEstate> createState() =>
      _AnnouncingMoreRealEstateState();
}

class _AnnouncingMoreRealEstateState extends State<AnnouncingMoreRealEstate> {
  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () => Get.to(
              () => const AnnouncingMoreRealEstateAdd(
                    id: '0',
                  ),
              transition: Transition.fadeIn),
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              color: Root.headercolor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Root.tabtextcolor,
                size: Root.headersize,
              ),
            ),
          ),
        ),
        backgroundColor: Root.backgroundApp,
        appBar: AppBar(
          leading: const CustomBackButtton(),
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustomTextSearch(
              controller: Data.search,
              hints: "19".tr,
              onChanged: (text) {
                setState(() {
                  Data.listData = Data.filterData
                      .where((item) => item['dscrp']!.contains(text))
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
                  color: Root.bottombg,
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
        body: Data.listData.isEmpty
            ? const Center(
                child: CustomNoNotes(),
              )
            : Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Center(
                      child: SizedBox(
                    width: Get.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Center(
                        child: DataTable(
                            headingRowColor: MaterialStateColor.resolveWith(
                              (states) {
                                return Root.bottombg;
                              },
                            ),
                            columns: [
                              DataColumn(
                                  label: SizedBox(
                                width: Get.width * .3,
                                child: Center(
                                  child: CustomText(
                                      color: Root.tabtextcolor,
                                      data: "اسم المحكمة",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip),
                                ),
                              )),
                              DataColumn(
                                  label: SizedBox(
                                width: Get.width * .3,
                                child: Center(
                                  child: CustomText(
                                      color: Root.tabtextcolor,
                                      data: "نوع الملك",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip),
                                ),
                              )),
                              DataColumn(
                                  label: SizedBox(
                                width: Get.width * .15,
                                child: Center(
                                  child: CustomText(
                                      color: Root.tabtextcolor,
                                      data: "تاريخ المزاد المعلن عنه",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip),
                                ),
                              )),
                              DataColumn(
                                  label: CustomText(
                                      color: Root.tabtextcolor,
                                      data: "17".tr,
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip)),
                              DataColumn(label: Container()),
                            ],
                            rows:
                                List.generate(Data.listData.length, (rowIndex) {
                              var item = Data.listData[rowIndex];
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: Get.width * .3,
                                        child: Center(
                                          child: CustomAppBar(
                                            color: Root.textcolor,
                                            data: "${item["lawname"]}",
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: Get.width * .3,
                                        child: Center(
                                          child: CustomAppBar(
                                            color: Root.textcolor,
                                            data: "${item["type"]}",
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: Get.width * .15,
                                        child: Center(
                                          child: CustomAppBar(
                                            color: Root.textcolor,
                                            data: "${item["date"]}",
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(SizedBox(
                                    width: 30,
                                    child: Center(
                                      child: Icon(
                                        Icons.circle_rounded,
                                        size: Root.iconsSize,
                                        color: item['status'] == 1
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  )),
                                  DataCell(GestureDetector(
                                    onTap: () => Get.to(
                                        () => ViewAnnouncingMoreRealEstate(
                                              item: item,
                                              title: widget.title,
                                            ),
                                        transition: Transition.fadeIn),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove_red_eye_rounded,
                                        size: Root.iconsSize,
                                        color: Root.iconColor,
                                      ),
                                    ),
                                  )),
                                ],
                              );
                            })),
                      ),
                    ),
                  )),
                ),
              ),
      ),
    );
  }
}

class ViewAnnouncingMoreRealEstate extends StatelessWidget {
  final Map item;
  final String title;
  const ViewAnnouncingMoreRealEstate(
      {required this.item, required this.title, super.key});

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
                color: Root.headercolor,
                data: "",
                size: Root.headersize,
                textOverflow: TextOverflow.clip),
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.1, 0.9],
                    colors: [Root.color1, Root.color2],
                  ),
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
                                "${ApiClass.api}/AnnouncingMoreRealEstate/${item['img']}",
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
                          color: Root.color2,
                          data: "${"167".tr} : ${item['lawname']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.color2,
                          data: "${"168".tr} : ${item['type']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.color2,
                          data: "${"169".tr} : ${item['owners']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.color2,
                          data: "${"170".tr} : ${item['space']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.color2,
                          data: "${"171".tr} : ${item['address']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.color2,
                          data: "${"172".tr} : ${item['price']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: CustomText(
                          color: Root.color2,
                          data: "${"173".tr} : ${item['date']}",
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
                          border: Border.all(width: 1.5, color: Root.color2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ScrollbarTheme(
                            data: ScrollbarThemeData(
                              thumbColor: MaterialStateProperty.all<Color>(
                                  Root.bottombg),
                            ),
                            child: Scrollbar(
                              radius: const Radius.circular(50),
                              thickness: 1.5,
                              trackVisibility: true,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: CustomText(
                                    color: Colors.black,
                                    data: "${item['dscrp']}",
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip),
                              ),
                            ))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                              data: "43".tr,
                              ontap: () {
                                Data.updateData(
                                    "AnnouncingMoreRealEstate/UpdateData",
                                    {"id": item['id'], "status": 1});
                                getdata();
                              }),
                          CustomButton(
                              data: "44".tr,
                              ontap: () {
                                Data.deleteData(
                                    "AnnouncingMoreRealEstate/DeleteAll?id=${item['id']}");
                                getdata();
                              }),
                        ],
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
  final String id;
  const AnnouncingMoreRealEstateAdd({required this.id, super.key});

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
                color: Root.headercolor,
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
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.1, 0.9],
                    colors: [Root.color1, Root.color2],
                  ),
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
                                      color: Root.headercolor,
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
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: const [0.1, 0.9],
                                  colors: [Root.color1, Root.color2],
                                ),
                              ),
                              width: Get.width * .8,
                              child: Center(
                                child: CustomText(
                                    color: Colors.white,
                                    data: "47".tr,
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
