import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:law/Page/contract/bicyclecontract.dart';
import 'package:law/Page/contract/billcontract.dart';
import 'package:law/Page/contract/carcontract.dart';
import 'package:law/Page/contract/estatecontract.dart';
import 'package:law/Page/contract/insurancecontract.dart';
import 'package:law/Page/contract/khuladivorce.dart';
import 'package:law/Page/contract/lawyerscontract.dart';
import 'package:law/Page/contract/marriedcontract.dart';
import 'package:law/Page/contract/revocabledivorce.dart';
import 'package:law/Page/contract/specialpenalagency.dart';
import 'package:law/contant/root.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Contractpdf {
  final Function()? ontap;
  final String title;
  Contractpdf({required this.ontap, required this.title});
}

class ContactClass {
  static List<Contractpdf> contractpdf = [
    Contractpdf(
      ontap: () {
        Get.to(
            () => LawyersContract(
                  title: "106".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "106".tr,
    ),
    Contractpdf(
      ontap: () {
        Get.to(
            () => EstateContract(
                  title: "116".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "116".tr,
    ),
    Contractpdf(
      ontap: () {
        Get.to(
            () => MarriedContract(
                  title: "138".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "138".tr,
    ),
    Contractpdf(
      ontap: () {
        Get.to(
            () => RevocableDivorce(
                  title: "151".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "151".tr,
    ),
    Contractpdf(
      ontap: () {
        Get.to(
            () => KhulaDivorce(
                  title: "154".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "154".tr,
    ),
    Contractpdf(
      ontap: () {
        Get.to(
            () => SpecialPenalAgency(
                  title: "161".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "161".tr,
    ),
    Contractpdf(
      ontap: () {
        Get.to(
            () => CarContract(
                  title: "185".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "185".tr,
    ),
    Contractpdf(
      ontap: () {
        Get.to(
            () => BicycleContract(
                  title: "200".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "200".tr,
    ),
    Contractpdf(
      ontap: () {
        Get.to(
            () => Insurance(
                  title: "203".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "203".tr,
    ),
    Contractpdf(
      ontap: () {
        Get.to(
            () => BillContract(
                  title: "209".tr,
                ),
            transition: Transition.fadeIn);
        clean();
      },
      title: "209".tr,
    ),
  ];

  static TextEditingController laweyrsname = TextEditingController();
  static String gender = "183".tr;
  static String married = "184".tr;
  static TextEditingController laweyrsaddress = TextEditingController();
  static TextEditingController username = TextEditingController();
  static TextEditingController useraddress = TextEditingController();
  static TextEditingController total = TextEditingController();
  static TextEditingController dscrp = TextEditingController();
  static TextEditingController price = TextEditingController();
  static TextEditingController department = TextEditingController();
  static TextEditingController lawname = TextEditingController();
  static TextEditingController lawend = TextEditingController();
  static TextEditingController paymentway = TextEditingController();
  static TextEditingController payname = TextEditingController();
  static TextEditingController payhome = TextEditingController();
  static TextEditingController payahalla = TextEditingController();
  static TextEditingController payalley = TextEditingController();
  static TextEditingController paytype = TextEditingController();
  static TextEditingController payno = TextEditingController();
  static TextEditingController payphone = TextEditingController();
  static TextEditingController userhome = TextEditingController();
  static TextEditingController userahalla = TextEditingController();
  static TextEditingController useralley = TextEditingController();
  static TextEditingController usertype = TextEditingController();
  static TextEditingController userno = TextEditingController();
  static TextEditingController userphone = TextEditingController();
  static TextEditingController moredetails = TextEditingController();
  static TextEditingController auctioneername = TextEditingController();

  // Car Contract
  static TextEditingController paynames = TextEditingController();
  static TextEditingController payaddress = TextEditingController();
  static TextEditingController paymahalas = TextEditingController();
  static TextEditingController paynalley = TextEditingController();
  static TextEditingController paynos = TextEditingController();
  static TextEditingController paytypes = TextEditingController();
  static TextEditingController payIDNo = TextEditingController();
  static TextEditingController payPhone = TextEditingController();
  static TextEditingController customernames = TextEditingController();
  static TextEditingController customeraddress = TextEditingController();
  static TextEditingController customermahalas = TextEditingController();
  static TextEditingController customernalley = TextEditingController();
  static TextEditingController customernos = TextEditingController();
  static TextEditingController customertypes = TextEditingController();
  static TextEditingController customerIDNo = TextEditingController();
  static TextEditingController customerPhone = TextEditingController();
  static TextEditingController carNo = TextEditingController();
  static TextEditingController cartype = TextEditingController();
  static TextEditingController carmodel = TextEditingController();
  static TextEditingController carcolor = TextEditingController();
  static TextEditingController carengineNo = TextEditingController();
  static TextEditingController carChassis = TextEditingController();
  static TextEditingController carprice = TextEditingController();
  static TextEditingController carpayment = TextEditingController();
  static TextEditingController carResidual = TextEditingController();
  static TextEditingController carRestorePrice = TextEditingController();

  static clean() {
    laweyrsname.clear();
    laweyrsaddress.clear();
    username.clear();
    useraddress.clear();
    total.clear();
    dscrp.clear();
    price.clear();
    department.clear();
    lawname.clear();
    lawend.clear();
    paymentway.clear();
    payname.clear();
    payhome.clear();
    payahalla.clear();
    payalley.clear();
    paytype.clear();
    payno.clear();
    userhome.clear();
    userahalla.clear();
    userahalla.clear();
    useralley.clear();
    usertype.clear();
    userno.clear();
    moredetails.clear();
    auctioneername.clear();
    gender = "183".tr;
    married = "184".tr;
    // Car Contract
    paynames.clear();
    payaddress.clear();
    paymahalas.clear();
    paynalley.clear();
    paynos.clear();
    paytypes.clear();
    payIDNo.clear();
    payPhone.clear();
    customernames.clear();
    customeraddress.clear();
    customermahalas.clear();
    customernalley.clear();
    customernos.clear();
    customertypes.clear();
    customerIDNo.clear();
    customerPhone.clear();
    carNo.clear();
    cartype.clear();
    carmodel.clear();
    carcolor.clear();
    carengineNo.clear();
    carChassis.clear();
    carprice.clear();
    carpayment.clear();
    carResidual.clear();
    carRestorePrice.clear();
    Get.appUpdate();
    Get.forceAppUpdate();
  }

  static Future<void> createPdf(
    String header,
    String title,
    String row1,
    String row2,
    String dscrp,
    String endrow1,
    String endrow2,
    String dscrp2,
    String footer,
    String name,
    String name2,
  ) async {
    final pdf = pw.Document();
    final font = await _loadArabicFont();

    PdfPageFormat a4 = PdfPageFormat.a4.copyWith(
      marginLeft: 20,
      marginTop: 20,
      marginRight: 20,
      marginBottom: 20,
    );
    pdf.addPage(
      pw.Page(
        pageFormat: a4,
        build: (pw.Context context) => pw.Align(
          alignment: pw.Alignment.topRight,
          child: pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                        child: pw.Text(
                      header,
                      style: pw.TextStyle(font: font),
                    )),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 5),
                        child: pw.Text(
                          title,
                          style: pw.TextStyle(font: font),
                        )),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 2),
                        child: pw.Row(children: [
                          pw.Column(children: [
                            pw.Text(
                              row1,
                              style: pw.TextStyle(font: font),
                            )
                          ]),
                          pw.SizedBox(width: 150),
                          pw.Column(children: [
                            pw.Text(
                              row2,
                              style: pw.TextStyle(font: font),
                            )
                          ])
                        ])),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 5),
                        child: pw.Text(
                          dscrp,
                          style: pw.TextStyle(font: font),
                        )),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 30),
                        child: pw.Row(children: [
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  endrow1,
                                  style: pw.TextStyle(font: font),
                                ),
                              ]),
                          pw.SizedBox(width: 150),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  endrow2,
                                  style: pw.TextStyle(font: font),
                                ),
                              ])
                        ])),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 10),
                        child: pw.Text(
                          dscrp2,
                          style: pw.TextStyle(font: font),
                        )),
                    pw.Align(
                        alignment: pw.Alignment.bottomLeft,
                        child: pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: pw.Text(
                              footer,
                              style: pw.TextStyle(font: font),
                            )))
                  ])),
        ),
      ),
    );
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');

    await file.writeAsBytes(await pdf.save());
    await saveAndLaunchFile(file.readAsBytesSync(), "example.pdf");
  }

  static Future<void> insuancePdf(String header, String title, String row1,
      String row2, String row3, String name, String name2,double padding) async {
    final pdf = pw.Document();
    final font = await _loadArabicFont();

    PdfPageFormat a4 = PdfPageFormat.a4.copyWith(
      marginLeft: 20,
      marginTop: 20,
      marginRight: 20,
      marginBottom: 20,
    );
    pdf.addPage(
      pw.Page(
        pageFormat: a4,
        build: (pw.Context context) => pw.Align(
          alignment: pw.Alignment.topRight,
          child: pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                        child: pw.Text(
                      header,
                      style: pw.TextStyle(font: font,fontSize: 25),
                    )),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 5),
                        child: pw.Text(
                          title,
                          style: pw.TextStyle(font: font,fontSize: 25),
                        )),
                    pw.Padding(
                      padding:  pw.EdgeInsets.symmetric(vertical: padding),
                      child: pw.Text(name, style: pw.TextStyle(font: font,fontSize: 25)),
                    ),
                    pw.Padding(
                      padding:  pw.EdgeInsets.symmetric(vertical: padding),
                      child: pw.Text(name2, style: pw.TextStyle(font: font,fontSize: 25)),
                    ),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 5),
                        child: pw.Row(children: [
                          pw.Column(children: [
                            pw.Text(
                              row1,
                              style: pw.TextStyle(font: font,fontSize: 25),
                            )
                          ]),
                          pw.SizedBox(width: 100),
                          pw.Column(children: [
                            pw.Text(
                              row2,
                              style: pw.TextStyle(font: font,fontSize: 25),
                            )
                          ]),
                          pw.SizedBox(width: 100),
                          pw.Column(children: [
                            pw.Text(
                              row3,
                              style: pw.TextStyle(font: font,fontSize: 25),
                            )
                          ]),
                        ])),
                  ])),
        ),
      ),
    );
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');

    await file.writeAsBytes(await pdf.save());
    await saveAndLaunchFile(file.readAsBytesSync(), "example.pdf");
  }

  static Future<void> createEstatePdf(
    String header,
    String title,
    String row1,
    String row2,
    String dscrp,
    String endrow1,
    String endrow2,
    String dscrp2,
    String footer,
    String name,
    String name2,
  ) async {
    final pdf = pw.Document();
    final font = await _loadArabicFont();

    PdfPageFormat a4 = PdfPageFormat.a4.copyWith(
      marginLeft: 20,
      marginTop: 20,
      marginRight: 20,
      marginBottom: 20,
    );
    pdf.addPage(
      pw.Page(
        pageFormat: a4,
        build: (pw.Context context) => pw.Align(
          alignment: pw.Alignment.topRight,
          child: pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Center(
                        child: pw.Text(
                      header,
                      style: pw.TextStyle(font: font),
                    )),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 5),
                        child: pw.Text(
                          title,
                          style: pw.TextStyle(font: font),
                        )),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 2),
                        child: pw.Row(children: [
                          pw.Column(children: [
                            pw.Text(
                              row1,
                              style: pw.TextStyle(font: font),
                            )
                          ]),
                          pw.SizedBox(width: 150),
                          pw.Column(children: [
                            pw.Text(
                              row2,
                              style: pw.TextStyle(font: font),
                            )
                          ])
                        ])),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 5),
                        child: pw.Text(
                          dscrp,
                          style: pw.TextStyle(font: font),
                        )),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 30),
                        child: pw.Row(children: [
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  endrow1,
                                  style: pw.TextStyle(font: font),
                                ),
                                pw.Padding(
                                    padding: const pw.EdgeInsets.symmetric(
                                        vertical: 75),
                                    child: pw.Text(
                                      name,
                                      style: pw.TextStyle(font: font),
                                    ))
                              ]),
                          pw.SizedBox(width: 150),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  endrow2,
                                  style: pw.TextStyle(font: font),
                                ),
                                pw.Padding(
                                    padding: const pw.EdgeInsets.symmetric(
                                        vertical: 75),
                                    child: pw.Text(
                                      name2,
                                      style: pw.TextStyle(font: font),
                                    ))
                              ])
                        ])),
                    pw.Padding(
                        padding: const pw.EdgeInsets.symmetric(vertical: 10),
                        child: pw.Text(
                          dscrp2,
                          style: pw.TextStyle(font: font),
                        )),
                    pw.Align(
                        alignment: pw.Alignment.bottomLeft,
                        child: pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: pw.Text(
                              footer,
                              style: pw.TextStyle(font: font),
                            )))
                  ])),
        ),
      ),
    );
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');

    await file.writeAsBytes(await pdf.save());
    await saveAndLaunchFile(file.readAsBytesSync(), "example.pdf");
  }

  static Future<pw.Font> _loadArabicFont() async {
    final fontData = await rootBundle.load(Root.font);
    final fontBytes = ByteData.sublistView(fontData.buffer.asByteData());

    return pw.Font.ttf(fontBytes);
  }

  static Future<void> saveAndLaunchFile(
      List<int> bytes, String filename) async {
    final directory = await getExternalStorageDirectory();
    final path = directory!.path;
    final file = File("$path/$filename");
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$filename');
  }
}
