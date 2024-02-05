import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Data/homescreen.dart';
import 'package:lawdashboard/constant/api.dart';
import 'package:lawdashboard/constant/root.dart';
import 'package:lawdashboard/widget/customback.dart';
import 'package:lawdashboard/widget/custombutton.dart';
import 'package:lawdashboard/widget/customnonotes.dart';
import 'package:lawdashboard/widget/customsearchtext.dart';
import 'package:lawdashboard/widget/customtext.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

getdata() async {
  Data.listData.clear();
  Data.clear();
  Data.listData = await Data.getData("Consultation/GetAll");
  Get.forceAppUpdate();
}

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  State<Consultation> createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
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
                      .where((item) => item['type']!.contains(text))
                      .toList();
                });
              },
              showsearch: Data.isSearching,
              title: "3".tr),
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
                  child: Center(
                      child: SizedBox(
                    width: Get.width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          headingRowColor: MaterialStateColor.resolveWith(
                            (states) {
                              return Root.bottombg;
                            },
                          ),
                          dataRowMaxHeight: 75,
                          columns: [
                            DataColumn(
                                label: SizedBox(
                              width: Get.width * .2,
                              child: CustomText(
                                  color: Root.tabtextcolor,
                                  data: "34".tr,
                                  size: Root.textsize,
                                  textOverflow: TextOverflow.ellipsis),
                            )),
                            DataColumn(
                                label: CustomText(
                                    color: Root.tabtextcolor,
                                    data: "18".tr,
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.ellipsis)),
                            DataColumn(
                                label: CustomText(
                                    color: Root.tabtextcolor,
                                    data: "17".tr,
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.ellipsis)),
                            DataColumn(label: Container()),
                          ],
                          rows: List.generate(Data.listData.length, (rowIndex) {
                            var item = Data.listData[rowIndex];
                            return DataRow(
                              cells: [
                                DataCell(
                                  SizedBox(
                                    width: Get.width * .2,
                                    child: Center(
                                      child: CustomText(
                                        color: Root.textcolor,
                                        data: "${item["type"]}",
                                        size: Root.textsize,
                                        textOverflow: TextOverflow.ellipsis,
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
                                        data: "${item["phone"]}",
                                        size: Root.textsize,
                                        textOverflow: TextOverflow.ellipsis,
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
                                      () => ViewConsultation(item: item),
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
                  )),
                ),
              ),
      ),
    );
  }
}

class ViewConsultation extends StatelessWidget {
  final Map item;
  const ViewConsultation({required this.item, super.key});

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
              data: "3".tr,
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
                item['files'] != null &&
                        item['files'].toString().contains(".pdf")
                    ? Container(
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        height: Get.height / 1.5,
                        child: SfPdfViewer.network(
                            '${ApiClass.api}/Consultation/${item['files']}'))
                    : const SizedBox(),
                item['files'] != null &&
                            item['files'].toString().contains(".png") ||
                        item['files'].toString().contains(".jpg")
                    ? Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          width: 350,
                          height: 350,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: CachedNetworkImageProvider(
                                      "${ApiClass.api}/Consultation/${item['files']}",
                                      headers: const {"accept": "*/*"}))),
                        ),
                      )
                    : const SizedBox(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: CustomText(
                      color: Root.textcolor,
                      data: "${"34".tr} : ${item['type']}",
                      size: Root.textsize,
                      textOverflow: TextOverflow.clip),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: CustomText(
                      color: Root.textcolor,
                      data: "${"35".tr} : ${item['address']}",
                      size: Root.textsize,
                      textOverflow: TextOverflow.clip),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: CustomText(
                      color: Root.textcolor,
                      data: "${"18".tr} : ${item['phone']}",
                      size: Root.textsize,
                      textOverflow: TextOverflow.clip),
                ),
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
                    child: Scrollbar(
                      radius: const Radius.circular(50),
                      thickness: 1.5,
                      trackVisibility: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: CustomText(
                            color: Root.bottombg,
                            data: "${item['dscrp']}",
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: Get.width * .8,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: CustomButton(
                        data: "37".tr,
                        ontap: () {
                          Data.updateData("Consultation/UpdateData",
                              {"id": item['id'], "UserID": "0", "status": "1"});
                          Data.urllauncher("https://wa.me/964${item['phone']}");
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
