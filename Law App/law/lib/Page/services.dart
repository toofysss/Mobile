import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/services.dart';
import 'package:law/Desing/customservices.dart';
import 'package:law/Page/services/appointmentlawyer.dart';
import 'package:law/Page/services/books.dart';
import 'package:law/Page/services/cases.dart';
import 'package:law/Page/services/consultation.dart';
import 'package:law/Page/services/contracts.dart';
import 'package:law/Page/services/decisionscouncil.dart';
import 'package:law/Page/services/iraqbank.dart';
import 'package:law/Page/services/iraqportal.dart';
import 'package:law/Page/services/yourright.dart';
import 'package:law/class/books.dart';
import 'package:law/class/contract.dart';
import 'package:law/class/datahelper.dart';
import 'package:law/class/decisionscouncilministers.dart';
import 'package:law/class/iraqbank.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtextfield.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 110,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      children: [
        // توكيل محامي
        CustomServices(
            data: "12".tr,
            ontap: () => Get.to(() => const AppointmentLawyer(),
                transition: Transition.fadeIn)),
        // استشارة قانونية

        CustomServices(
            data: "11".tr,
            ontap: () => Get.to(() => const Consultation(userID: '0'),
                transition: Transition.fadeIn)),
        // العرائض والطلبات

        CustomServices(
          data: "13".tr,
          ontap: () async {
            if (Data.laweysID.isEmpty) {
              return AlertClass.success("108".tr);
            }
            List<ContractData> yourRightData = await DBHelper()
                .getPetitionsLegalRequests('petitionslegalrequests');
            Get.to(
              () => Contract(
                title: '13'.tr,
                data: yourRightData,
              ),
              transition: Transition.fadeIn,
            );
          },
        ),

        // العقود
        CustomServices(
          data: "16".tr,
          ontap: () async {
            List<ContractData> yourRightData =
                await DBHelper().getPetitionsLegalRequests('contract');
            Get.to(() => ContractSelect(title: '16'.tr, data: yourRightData),
                transition: Transition.fadeIn);
          },
        ),
        // جدول القضايا
        CustomServices(
          data: "74".tr,
          ontap: () async {
            if (Data.laweysID.isEmpty) {
              return AlertClass.success("108".tr);
            }
            Get.to(() => const Cases(), transition: Transition.fadeIn);
          },
        ),

        // بوابة القضاء العراقي
        CustomServices(
            data: "14".tr,
            ontap: () => Get.to(() => const IraqPortal(),
                transition: Transition.fadeIn)),

        // قرارات محكمة التمييز
        CustomServices(
          data: "17".tr,
          ontap: () async {
            List<IraqBankData> yourRightData = await DBHelper().fetchData(
                'decisionscourtcassation',
                'decisionscourtcassationdetails',
                "decisionsCourtCassationID");
            Get.to(() => IraqBank(data: yourRightData, title: "17".tr),
                transition: Transition.fadeIn);
          },
        ),

        // المحكمة الاتحادية العليا
        CustomServices(
          data: "18".tr,
          ontap: () async {
            TextEditingController count = TextEditingController();
            TextEditingController date = TextEditingController();
            AlertClass.showalert(
              "18".tr,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                      textInputType: TextInputType.number,
                      controller: count,
                      maxline: 1,
                      hints: "83".tr,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                      textInputType: TextInputType.datetime,
                      controller: date,
                      maxline: 1,
                      hints: "84".tr,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomButton(
                      data: "46".tr,
                      ontap: () =>
                          DecisionsFederalSupremeCourtClass.getgazetter(
                              count.text, date.text),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        // دردشة مع الذكاء الاصطناعي
        CustomServices(
          data: "96".tr,
          ontap: () => Data.urllauncher("https://chat.openai.com/"),
        ),

        // حقوقك
        CustomServices(
          data: "15".tr,
          ontap: () async {
            Get.to(
                () => YourRight(
                    yourRightInstance: YourRightClass.yourRightObjects),
                transition: Transition.fadeIn);
          },
        ),

        // جريدة الوقائع العراقية
        CustomServices(
          data: "24".tr,
          ontap: () async {
            TextEditingController search = TextEditingController();
            AlertClass.showalert(
                "24".tr,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                        textInputType: TextInputType.number,
                        controller: search,
                        maxline: 1,
                        hints: "45".tr),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomButton(
                          data: "46".tr,
                          ontap: () =>
                              IraqiGazetteClass.getgazetter(search.text)),
                    ),
                  ],
                ));
          },
        ),

        // قرارات مجلس الوزراء
        CustomServices(
          data: "20".tr,
          ontap: () async {
            List<DecisionsClass> yourRightData =
                await DBHelper().getDecisionsClass("decisionscouncil");
            Get.to(
              () => DecisionsCouncilMinisters(
                data: yourRightData,
                title: "20".tr,
              ),
              transition: Transition.fadeIn,
            );
          },
        ),
        // قرارات مجلس قيادة الثورة المنحل
        CustomServices(
          data: "19".tr,
          ontap: () async {
            List<DecisionsClass> yourRightData =
                await DBHelper().getDecisionsClass("decisionscommand");
            Get.to(
              () => DecisionsCouncilMinisters(
                data: yourRightData,
                title: "19".tr,
              ),
              transition: Transition.fadeIn,
            );
          },
        ),
        // البنك المركزي العراقي
        CustomServices(
          data: "21".tr,
          ontap: () async {
            List<IraqBankData> yourRightData = await DBHelper()
                .fetchData('iraqbank', 'iraqbank_details', "iraqBankID");
            Get.to(() => IraqBank(data: yourRightData, title: "21".tr),
                transition: Transition.fadeIn);
          },
        ),

        // الكتب
        CustomServices(
          data: "22".tr,
          ontap: () async {
            List<BooksDataClass> yourRightData =
                await DBHelper().getBooksDataClass('books');
            Get.to(
                () => Books(
                      data: yourRightData,
                      title: "22".tr,
                    ),
                transition: Transition.fadeIn);
          },
        ),

        // اوامر سلطة ائتلاف القانون
        CustomServices(
          data: "23".tr,
          ontap: () async {
            List<DecisionsClass> yourRightData =
                await DBHelper().getDecisionsClass("coalitionprovisional");
            Get.to(
                () => DecisionsCouncilMinisters(
                      data: yourRightData,
                      title: "23".tr,
                    ),
                transition: Transition.fadeIn);
          },
        ),
      ],
    );
  }
}
