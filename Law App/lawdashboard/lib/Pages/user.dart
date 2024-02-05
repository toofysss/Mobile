import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Data/homescreen.dart';
import 'package:lawdashboard/constant/api.dart';
import 'package:lawdashboard/constant/root.dart';
import 'package:lawdashboard/widget/alert.dart';
import 'package:lawdashboard/widget/customback.dart';
import 'package:lawdashboard/widget/custombutton.dart';
import 'package:lawdashboard/widget/customloading.dart';
import 'package:lawdashboard/widget/customnonotes.dart';
import 'package:lawdashboard/widget/customsearchtext.dart';
import 'package:lawdashboard/widget/customtext.dart';
import 'package:lawdashboard/widget/customtextfield.dart';
import 'package:animate_do/animate_do.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

getdata() async {
  Data.listData.clear();
  Data.clear();
  Data.listData = await Data.getData("LaweysControll/GetAlls");
  Get.forceAppUpdate();
}

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
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
              Get.to(() => const Rigester(), transition: Transition.fadeIn),
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
                      .where((item) => item['name']!.contains(text))
                      .toList();
                });
              },
              showsearch: Data.isSearching,
              title: "2".tr),
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
                                  label: SizedBox(
                                width: Get.width * .2,
                                child: CustomText(
                                    color: Root.tabtextcolor,
                                    data: "16".tr,
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip),
                              )),
                              DataColumn(
                                  label: SizedBox(
                                width: Get.width * .2,
                                child: CustomText(
                                    color: Root.tabtextcolor,
                                    data: "18".tr,
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip),
                              )),
                              DataColumn(
                                  label: SizedBox(
                                width: 40,
                                child: CustomText(
                                    color: Root.tabtextcolor,
                                    data: "17".tr,
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip),
                              )),
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
                                        child: CustomText(
                                          color: Root.textcolor,
                                          data: "${item["name"]}",
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
                                          data: "${item["phone"]}",
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(SizedBox(
                                    width: 15,
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
                                    width: 15,
                                    child: GestureDetector(
                                      onTap: () => Get.to(
                                          () => ViewUser(item: item),
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
                      ),
                    )),
              ),
      ),
    );
  }
}

class ViewUser extends StatelessWidget {
  final Map item;
  const ViewUser({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController rating = TextEditingController();
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
              data: "2".tr,
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
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                                "${ApiClass.api}/LaweysControll/${item['img']}",
                                headers: const {"accept": "*/*"}))),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                                "${ApiClass.api}/LaweysControll/${item['imgcardlaw']}",
                                headers: const {"accept": "*/*"}))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: CustomText(
                      color: Root.textcolor,
                      data: "${"16".tr} : ${item['name']}",
                      size: Root.textsize,
                      textOverflow: TextOverflow.clip),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: CustomText(
                      color: Root.textcolor,
                      data: "${"20".tr} : ${item['depart']}",
                      size: Root.textsize,
                      textOverflow: TextOverflow.clip),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: CustomText(
                      color: Root.textcolor,
                      data: "${"21".tr} : ${item['room']}",
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: CustomText(
                      color: Root.textcolor,
                      data: "${"22".tr} : ${item['city']}",
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
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    width: Get.width * .8,
                    child: CustomTextField(
                        textInputType: TextInputType.name,
                        controller: rating,
                        maxline: 1,
                        maxlength: 5,
                        hints: "23".tr),
                  ),
                ),
                Center(
                  child: Container(
                    width: Get.width * .8,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: CustomButton(
                        data: "25".tr,
                        ontap: () async {
                          AlertClass.waiting();
                          var response = await http.put(
                            Uri.parse("${ApiClass.api}/LaweysControll/Update"),
                            headers: {
                              "accept": "text/plain",
                              "Content-Type": "application/json"
                            },
                            body: jsonEncode({
                              "id": item['id'],
                              "rating": rating.text,
                              "status": 1
                            }),
                          );
                          if (response.statusCode == 200) {
                            var responsebody = jsonDecode(response.body);
                            String passowrd = "${Random().nextInt(1000000)}";

                            Data.insertUser(
                                "UserControll/AddUser",
                                {
                                  "id": 0,
                                  "username": item['phone'],
                                  "password": passowrd,
                                  "lawersID": responsebody,
                                  "amount": "string"
                                },
                                passowrd,
                                "${item['phone']}");
                          }

                          getdata();
                        }),
                  ),
                ),
                Center(
                  child: Container(
                    width: Get.width * .8,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: CustomButton(
                        data: "26".tr,
                        ontap: () {
                          Data.deleteData(
                              "LaweysControll/DeleteAll?id=${item['id']}");
                          getdata();
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

class Rigester extends StatefulWidget {
  const Rigester({super.key});

  @override
  State<Rigester> createState() => _RigesterState();
}

class _RigesterState extends State<Rigester> {
  @override
  void initState() {
    RigesterClass.cityID.text = "31".tr;
    RigesterClass.gender.text = "28".tr;
    getgoverment();
    super.initState();
  }

  getgoverment() async {
    RigesterClass.goverment.clear();
    var response =
        await http.get(Uri.parse("${ApiClass.api}/CityControll/GetAll"));
    if (response.statusCode == 200) {
      List<dynamic> responsebody = jsonDecode(response.body);
      Root.lang.text == "English"
          ? RigesterClass.goverment = responsebody.map((item) {
              return DropdownItem('${item['id']}', "${item['dscrpE']}");
            }).toList()
          : RigesterClass.goverment = responsebody.map((item) {
              return DropdownItem('${item['id']}', "${item['dscrp']}");
            }).toList();
      return responsebody;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButtton(),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Root.backgroundApp,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: FutureBuilder(
              future: getgoverment(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 300,
                            width: Get.width / 2,
                            child: Center(
                              child: LottieBuilder.asset(
                                Root.rigester,
                                repeat: false,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomText(
                              data: "25".tr,
                              size: Root.headersize,
                              color: Root.headercolor,
                              textOverflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        FlipInY(
                            duration: Root.duration,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: CustomTextField(
                                controller: RigesterClass.name,
                                textInputType: TextInputType.emailAddress,
                                hints: '16'.tr,
                                maxline: 1,
                                maxlength: 150,
                              ),
                            )),
                        FlipInY(
                            duration: Root.duration,
                            child: Container(
                              width: Get.width * .8,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Root.textcolor,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Material(
                                elevation: 6,
                                shadowColor: Root.textcolor,
                                borderRadius: BorderRadius.circular(30),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconEnabledColor: Root.iconColor,
                                    iconDisabledColor: Root.iconColor,
                                    borderRadius: BorderRadius.circular(25),
                                    hint: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: CustomText(
                                        color: Root.textcolor,
                                        data: RigesterClass.gender.text,
                                        size: Root.textsize,
                                        textOverflow: TextOverflow.clip,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      RigesterClass.gender.text = "$value";
                                    },
                                    items: [
                                      "29".tr,
                                      "30".tr,
                                    ]
                                        .map<DropdownMenuItem<String>>(
                                            (String value) =>
                                                DropdownMenuItem<String>(
                                                    value: value,
                                                    child: CustomText(
                                                        color: Root.textcolor,
                                                        data: value,
                                                        textOverflow:
                                                            TextOverflow.clip,
                                                        size: Root.textsize)))
                                        .toList(),
                                  ),
                                ),
                              ),
                            )),
                        FlipInY(
                            duration: Root.duration,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: CustomTextField(
                                controller: RigesterClass.depart,
                                textInputType: TextInputType.emailAddress,
                                hints: '20'.tr,
                                maxline: 1,
                                maxlength: 100,
                              ),
                            )),
                        FlipInY(
                            duration: Root.duration,
                            child: Container(
                                width: Get.width * 0.8,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Root.bottombg,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Material(
                                  elevation: 6,
                                  shadowColor: Root.bottombg,
                                  borderRadius: BorderRadius.circular(30),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      iconEnabledColor: Root.iconColor,
                                      iconDisabledColor: Root.iconColor,
                                      borderRadius: BorderRadius.circular(25),
                                      hint: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: CustomText(
                                          color: Root.textcolor,
                                          data: RigesterClass.cityID.text,
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          RigesterClass.cityID.text = value!;
                                        });
                                      },
                                      items: RigesterClass.goverment
                                          .map<DropdownMenuItem<String>>(
                                              (value) =>
                                                  DropdownMenuItem<String>(
                                                      onTap: () {
                                                        RigesterClass.cityid =
                                                            value.value;
                                                      },
                                                      value: value.label,
                                                      child: CustomText(
                                                          color: Root.textcolor,
                                                          data: value.label,
                                                          textOverflow:
                                                              TextOverflow.clip,
                                                          size: Root.textsize)))
                                          .toList(),
                                    ),
                                  ),
                                ))),
                        FlipInY(
                            duration: Root.duration,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: CustomTextField(
                                controller: RigesterClass.city,
                                textInputType: TextInputType.emailAddress,
                                hints: '22'.tr,
                                maxline: 1,
                                maxlength: 100,
                              ),
                            )),
                        FlipInY(
                            duration: Root.duration,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: CustomTextField(
                                controller: RigesterClass.dscrp,
                                textInputType: TextInputType.name,
                                hints: '24'.tr,
                                maxline: 3,
                                maxlength: 350,
                              ),
                            )),
                        FlipInY(
                            duration: Root.duration,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: CustomTextField(
                                controller: RigesterClass.phone,
                                textInputType: TextInputType.name,
                                hints: '18'.tr,
                                maxline: 1,
                                maxlength: 15,
                              ),
                            )),
                        FlipInY(
                            duration: Root.duration,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: CustomTextField(
                                controller: RigesterClass.room,
                                textInputType: TextInputType.name,
                                hints: '21'.tr,
                                maxline: 1,
                                maxlength: 100,
                              ),
                            )),
                        GestureDetector(
                          onTap: () => RigesterClass.pickimg(),
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Root.headercolor),
                              width: Get.width * .8,
                              child: Center(
                                child: CustomText(
                                    color: Colors.white,
                                    data: "33".tr,
                                    size: Root.headersize,
                                    textOverflow: TextOverflow.clip),
                              )),
                        ),
                        GestureDetector(
                          onTap: () => RigesterClass.pickimgcardlaw(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Root.headercolor),
                            width: Get.width * .8,
                            child: Center(
                              child: CustomText(
                                  color: Colors.white,
                                  data: "32".tr,
                                  size: Root.headersize,
                                  textOverflow: TextOverflow.clip),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            RigesterClass.rigester();
                            getdata();
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Root.headercolor),
                            width: Get.width * .8,
                            child: Center(
                              child: CustomText(
                                  color: Colors.white,
                                  data: "25".tr,
                                  size: Root.headersize,
                                  textOverflow: TextOverflow.clip),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return const Center(child: Customloading());
              }),
        ),
      ),
    );
  }
}
