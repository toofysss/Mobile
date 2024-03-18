import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Data/homescreen.dart';
import 'package:lawdashboard/Data/news.dart';
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
  Data.listData = await Data.getData("BlogControll/Get");
  Get.forceAppUpdate();
}

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
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
          onTap: () =>
              Get.to(() => const ADDNews(), transition: Transition.fadeIn),
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
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                color: Root.headercolor,
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
              controller: Data.search,
              hints: "19".tr,
              onChanged: (text) {
                setState(() {
                  Data.listData = Data.filterData
                      .where((item) => item['title']!.contains(text))
                      .toList();
                });
              },
              showsearch: Data.isSearching,
              title: "5".tr),
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
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                      width: Get.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: DataTable(
                            headingRowColor: MaterialStateColor.resolveWith(
                              (states) {
                                return Root.bottombg;
                              },
                            ),
                            dataRowMaxHeight: 75,
                            columns: [
                              DataColumn(
                                  label: CustomText(
                                      color: Root.tabtextcolor,
                                      data: "39".tr,
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip)),
                              DataColumn(
                                  label: CustomText(
                                      color: Root.tabtextcolor,
                                      data: "40".tr,
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip)),
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
                                        width: Get.width * .2,
                                        child: CustomAppBar(
                                          color: Root.textcolor,
                                          data: "${item["title"]}",
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: Get.width * .2,
                                        child: CustomText(
                                          color: Root.textcolor,
                                          data: "${item["date"]}",
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip,
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
                                  DataCell(SizedBox(
                                    width: 30,
                                    child: GestureDetector(
                                      onTap: () => Get.to(
                                          () => NewsDetails(item: item),
                                          transition: Transition.fadeIn),
                                      child: Center(
                                        child: Icon(
                                          Icons.remove_red_eye_rounded,
                                          size: Root.iconsSize,
                                          color: Root.iconColor,
                                        ),
                                      ),
                                    ),
                                  )),
                                ],
                              );
                            })),
                      )),
                ),
              ),
      ),
    );
  }
}

class NewsDetails extends StatelessWidget {
  final Map item;
  const NewsDetails({required this.item, super.key});

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
                data: "${item['title']}",
                size: Root.headersize,
                textOverflow: TextOverflow.clip),
            leading: const CustomBackButtton()),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: Get.width,
            height: Get.height,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
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
                              "${ApiClass.api}/BlogControll/${item['img']}",
                          fit: BoxFit.fill,
                          width: 250,
                          height: 250,
                          placeholder: (context, url) => const SizedBox(
                              width: 250, height: 250, child: Customloading()),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: CustomText(
                        color: Root.headercolor,
                        data: "${item['title']}",
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
                        border: Border.all(width: 1.5, color: Root.bottombg),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ScrollbarTheme(
                        data: ScrollbarThemeData(
                          thumbColor:
                              MaterialStateProperty.all<Color>(Root.bottombg),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: CustomText(
                              color: Colors.black,
                              data: "${item['dscrp']}",
                              size: Root.textsize,
                              textOverflow: TextOverflow.clip),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                            data: "43".tr,
                            ontap: () {
                              Data.updateData("BlogControll/Update",
                                  {"id": item['id'], "status": 1});
                              getdata();
                            }),
                        CustomButton(
                            data: "44".tr,
                            ontap: () {
                              Data.deleteData(
                                  "BlogControll/Delete?id=${item['id']}");
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
      ),
    );
  }
}

class ADDNews extends StatelessWidget {
  const ADDNews({super.key});

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
                  data: "5".tr,
                  size: Root.headersize,
                  textOverflow: TextOverflow.clip),
              leading: const CustomBackButtton()),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      NewsClass.img != null
                          ? GestureDetector(
                              onTap: () => NewsClass.pickfile(),
                              child: Container(
                                width: Get.width * .8,
                                height: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: FileImage(NewsClass.img!),
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
                                onTap: () => NewsClass.pickfile(),
                                child: Center(
                                  child: CustomText(
                                      color: Root.headercolor,
                                      data: "42".tr,
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
                          controller: NewsClass.title,
                          hints: "39".tr,
                          maxline: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: NewsClass.dscrp,
                          hints: "41".tr,
                          maxline: 10,
                          maxlength: 5000,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: GestureDetector(
                            onTap: () => NewsClass.selectType(),
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
                                    data: "43".tr,
                                    size: Root.headersize,
                                    textOverflow: TextOverflow.clip),
                              ),
                            ),
                          )),
                    ]),
              ),
            ),
          ),
        ));
  }
}
