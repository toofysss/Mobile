import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Data/homescreen.dart';
import 'package:lawdashboard/constant/api.dart';
import 'package:lawdashboard/constant/root.dart';
import 'package:lawdashboard/widget/customappbar.dart';
import 'package:lawdashboard/widget/customback.dart';
import 'package:lawdashboard/widget/custombutton.dart';
import 'package:lawdashboard/widget/customnonotes.dart';
import 'package:lawdashboard/widget/customsearchtext.dart';
import 'package:lawdashboard/widget/customtext.dart';
import 'package:lawdashboard/widget/customtextfield.dart';

getdata() async {
  Data.listData.clear();
  Data.clear();
  Data.listData = await Data.getData("BooksLegalWritings/GetAll");
  Get.forceAppUpdate();
}

class BooksLegalWritings extends StatefulWidget {
  final String title;
  const BooksLegalWritings({required this.title, super.key});

  @override
  State<BooksLegalWritings> createState() => _BooksLegalWritingsState();
}

class _BooksLegalWritingsState extends State<BooksLegalWritings> {
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
              () => const ADDBooksLegalWritings(
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
                                width: Get.width * .7,
                                child: Center(
                                  child: CustomText(
                                      color: Root.tabtextcolor,
                                      data: "اسم الكتاب",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip),
                                ),
                              )),
                              DataColumn(label: Container()),
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
                                        width: Get.width * .7,
                                        child: Center(
                                          child: CustomAppBar(
                                            color: Root.textcolor,
                                            data: "${item["dscrp"]}",
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(GestureDetector(
                                    onTap: () => Data.urllauncher(
                                        "${ApiClass.api}/BooksLegalWritings/${item['files']}")
                                    ,
                                    child: Center(
                                      child: Icon(
                                        Icons.remove_red_eye_rounded,
                                        size: Root.iconsSize,
                                        color: Root.iconColor,
                                      ),
                                    ),
                                  )),
                                  DataCell(SizedBox(
                                    width: 25,
                                    child: GestureDetector(
                                      onTap: () {
                                        Data.deleteData(
                                            "BooksLegalWritings/DeleteAll?id=${item['id']}");
                                        getdata();
                                      },
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red),
                                          child: Icon(
                                            Icons.close,
                                            size: Root.iconsSize,
                                            color: Colors.white,
                                          ),
                                        ),
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

class ViewBooksLegalWritings extends StatelessWidget {
  final Map item;
  final String title;
  const ViewBooksLegalWritings(
      {required this.item, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.backgroundApp,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const CustomBackButtton(),
          title: CustomText(
              color: Root.headercolor,
              data: item['dscrp'],
              size: Root.headersize,
              textOverflow: TextOverflow.clip),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  height: 400,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.5, color: Root.bottombg)),
                  child: ScrollbarTheme(
                    data: ScrollbarThemeData(
                      thumbColor:
                          MaterialStateProperty.all<Color>(Root.bottombg),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: CustomText(
                          color: Root.bottombg,
                          data: "${item['files']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ADDBooksLegalWritings extends StatelessWidget {
  final String id;
  const ADDBooksLegalWritings({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.backgroundApp,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const CustomBackButtton(),
          title: CustomText(
              color: Root.headercolor,
              data: "",
              size: Root.headersize,
              textOverflow: TextOverflow.clip),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    width: Get.width * .8,
                    child: CustomTextField(
                        textInputType: TextInputType.name,
                        controller: Data.title,
                        maxline: 1,
                        maxlength: 150,
                        hints: "اسم الكتاب"),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    width: Get.width * .8,
                    child: CustomButton(
                        ontap: () => Data.pickfiles(), data: "تحميل الكتاب"),
                  ),
                ),
                Center(
                  child: Container(
                    width: Get.width * .8,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: CustomButton(
                        data: "47".tr,
                        ontap: () {
                          if (id == "0") {
                            Data.inserfile(
                              "BooksLegalWritings/Insert",
                            );
                          } else {
                            Data.updatefile("BooksLegalWritings/Update", id);
                          }
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
