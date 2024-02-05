import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Data/homescreen.dart';
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
  Data.listData = await Data.getData("DecisionsCourtCassation/GetAll");
  Get.forceAppUpdate();
}

class DecisionsCourtCassation extends StatefulWidget {
  final String title;
  const DecisionsCourtCassation({required this.title, super.key});

  @override
  State<DecisionsCourtCassation> createState() =>
      _DecisionsCourtCassationState();
}

class _DecisionsCourtCassationState extends State<DecisionsCourtCassation> {
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
              () => const ADDHeader(
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
                                  label: Center(
                                child: SizedBox(
                                  child: CustomText(
                                      color: Root.tabtextcolor,
                                      data: "35".tr,
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip),
                                ),
                              )),
                              DataColumn(label: Container()),
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
                                        width: Get.width * .3,
                                        child: CustomAppBar(
                                          color: Root.textcolor,
                                          data: "${item["dscrp"]}",
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(GestureDetector(
                                    onTap: () => Get.to(
                                        () => ViewDecisionsCourtCassation(
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
                                  DataCell(GestureDetector(
                                    onTap: () {
                                      Data.details.text = item['dscrp'];
                                      Get.to(
                                          () => ADDHeader(
                                                id: '${item['id']}',
                                              ),
                                          transition: Transition.fadeIn);
                                    },
                                    child: Center(
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Icon(
                                          Icons.edit,
                                          size: Root.iconsSize,
                                          color: Root.iconColor,
                                        ),
                                      ),
                                    ),
                                  )),
                                  DataCell(GestureDetector(
                                    onTap: () {
                                      Data.deleteData(
                                          "DecisionsCourtCassation/DeleteHeader?id=${item['id']}");
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

class ViewDecisionsCourtCassation extends StatelessWidget {
  final Map item;
  final String title;
  const ViewDecisionsCourtCassation(
      {required this.item, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () => Get.to(
              () => ADDData(
                    id: '0',
                    headerID: "${item['id']}",
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
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                          (states) {
                            return Root.bottombg;
                          },
                        ),
                        columns: [
                          DataColumn(
                              label: Center(
                            child: CustomText(
                                color: Root.tabtextcolor,
                                data: "35".tr,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip),
                          )),
                          DataColumn(
                              label: Center(
                            child: CustomText(
                                color: Root.tabtextcolor,
                                data: "24".tr,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip),
                          )),
                          DataColumn(
                              label: Center(
                            child: CustomText(
                                color: Root.tabtextcolor,
                                data: "49".tr,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip),
                          )),
                          DataColumn(
                              label: Center(
                            child: CustomText(
                                color: Root.tabtextcolor,
                                data: "53".tr,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip),
                          )),
                          DataColumn(label: Container()),
                          DataColumn(label: Container()),
                        ],
                        dataRowMaxHeight: 75,
                        rows: List.generate(item['details'].length, (rowIndex) {
                          var items = item['details'][rowIndex];
                          return DataRow(
                            cells: [
                              DataCell(
                                Center(
                                  child: SizedBox(
                                    width: 150,
                                    child: CustomAppBar(
                                      color: Root.textcolor,
                                      data: "${items["title"]}",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: SizedBox(
                                    width: 150,
                                    child: CustomAppBar(
                                      color: Root.textcolor,
                                      data: "${items["dscrp"]}",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: SizedBox(
                                    width: 150,
                                    child: CustomText(
                                      color: Root.textcolor,
                                      data: "${items["files"]}",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: SizedBox(
                                    width: 150,
                                    child: CustomText(
                                      color: Root.textcolor,
                                      data: "${items["img"]}",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(GestureDetector(
                                onTap: () {
                                  Data.title.text = items['title'];
                                  Data.details.text = items['dscrp'];
                                  Data.files.text = items['files'];
                                  Data.img.text = items['img'];
                                  Get.to(
                                      () => ADDData(
                                            headerID: "${item['id']}",
                                            id: '${item['id']}',
                                          ),
                                      transition: Transition.fadeIn);
                                },
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.edit,
                                      size: Root.iconsSize,
                                      color: Root.iconColor,
                                    ),
                                  ),
                                ),
                              )),
                              DataCell(GestureDetector(
                                onTap: () {
                                  Data.deleteData(
                                      "DecisionsCourtCassation/Delete?id=${items['id']}");
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
                              )),
                            ],
                          );
                        })),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ADDHeader extends StatelessWidget {
  final String id;
  const ADDHeader({required this.id, super.key});

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
                        controller: Data.details,
                        maxline: 1,
                        maxlength: 150,
                        hints: "39".tr),
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
                          Data.insertData(
                              "DecisionsCourtCassation/InsertHeader", {
                            "id": id,
                            "dscrp": Data.details.text,
                          });
                          getdata();
                        } else {
                          Data.updateData(
                              "DecisionsCourtCassation/UpdateHeader", {
                            "id": id,
                            "dscrp": Data.details.text,
                          });
                          getdata();
                        }
                        getdata();
                      },
                    ),
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

class ADDData extends StatelessWidget {
  final String id;
  final String headerID;
  const ADDData({required this.id, required this.headerID, super.key});

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
                        hints: "39".tr),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    width: Get.width * .8,
                    child: CustomTextField(
                        textInputType: TextInputType.name,
                        controller: Data.details,
                        maxline: 1,
                        maxlength: 5000,
                        hints: "24".tr),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    width: Get.width * .8,
                    child: CustomTextField(
                        textInputType: TextInputType.name,
                        controller: Data.files,
                        maxline: 1,
                        maxlength: 150,
                        hints: "49".tr),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    width: Get.width * .8,
                    child: CustomTextField(
                        textInputType: TextInputType.name,
                        controller: Data.img,
                        maxline: 1,
                        maxlength: 150,
                        hints: "53".tr),
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
                          Data.insertData("DecisionsCourtCassation/Insert", {
                            "id": id,
                            "title": Data.title.text,
                            "dscrp": Data.details.text,
                            "files": Data.files.text,
                            "img": Data.img.text,
                            "decisionsCourtCassationID": headerID
                          });
                          getdata();
                        } else {
                          Data.updateData("DecisionsCourtCassation/Update", {
                            "id": id,
                            "title": Data.title.text,
                            "dscrp": Data.details.text,
                            "files": Data.files.text,
                            "img": Data.img.text,
                          });
                          getdata();
                        }
                        getdata();
                      },
                    ),
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
