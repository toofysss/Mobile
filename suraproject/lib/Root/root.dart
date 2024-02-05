import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:suraproject/Pages/creditcard/creditcard.dart';

class Root {
  static String imgLoc = "images";
  static String spalshimage = "$imgLoc/splash.png";
  static String cardimage = "$imgLoc/card.png";
  static String fonts = "$imgLoc/WhiteVinegar-Regular.ttf";
  static Color primary = const Color(0xff1f242d);
  static Color secondry = const Color(0xffffffff);
  static Color secondry2 = const Color(0xff00eeff);

  static double headersize = 25;
}

class Company {
  Color endcolor;
  Color startcolor;
  IconData icon;
  Function() onTap;
  String title;

  Company({
    required this.title,
    required this.icon,
    required this.startcolor,
    required this.endcolor,
    required this.onTap,
  });
}

class LayerClass {
  static List<Company> data = [
    Company(
        title: "اصدار بطاقة",
        icon: FontAwesomeIcons.creditCard,
        onTap: () {
          Get.to(() => const CreditCard(), transition: Transition.fadeIn);
          CreditCardClass.namesize.text = "20";
          CreditCardClass.birthdaysize.text = "16";
          CreditCardClass.nosize.text = "14";
          CreditCardClass.spaceword.text = "2";
        },
        endcolor: const Color.fromARGB(255, 9, 66, 99),
        startcolor: const Color(0xff418EBA)),

    // Company(
    //     title: "10".tr,
    //     icon: FontAwesomeIcons.buildingColumns,
    //     onTap: () {},
    //     endcolor: const Color.fromARGB(255, 25, 92, 97),
    //     startcolor: const Color(0xff00CCA7)),
    // Company(
    //     title: "11".tr,
    //     icon: FontAwesomeIcons.commentsDollar,
    //     onTap: () {},
    //     endcolor: const Color(0xff00CCA7),
    //     startcolor: const Color(0xff30AE5A)),
    // Company(
    //     title: "17".tr,
    //     icon: FontAwesomeIcons.moneyBillTransfer,
    //     onTap: () {},
    //     endcolor: const Color.fromARGB(255, 228, 138, 3),
    //     startcolor: const Color.fromARGB(255, 254, 148, 9)),
    // Company(
    //     title: "42".tr,
    //     icon: FontAwesomeIcons.wallet,
    //     onTap: () async {},
    //     endcolor: const Color.fromARGB(255, 206, 43, 43),
    //     startcolor: const Color.fromARGB(255, 136, 15, 6)),
  ];
}

clean() {
  CreditCardClass.birthday.clear();
  CreditCardClass.name.clear();
  CreditCardClass.no.clear();
  CreditCardClass.namesize.text = "20";
  CreditCardClass.birthdaysize.text = "16";
  CreditCardClass.nosize.text = "14";
  FocusScope.of(Get.context!).requestFocus(CreditCardClass.namefocus);
}

class CreditCardClass {
  static TextEditingController name = TextEditingController();
  static FocusNode namefocus = FocusNode();
  static TextEditingController birthday = TextEditingController();
  static TextEditingController no = TextEditingController();
  static TextEditingController namesize = TextEditingController();
  static TextEditingController birthdaysize = TextEditingController();
  static TextEditingController nosize = TextEditingController();
  static TextEditingController spaceword = TextEditingController();

  static final screenshotController = ScreenshotController();
}
