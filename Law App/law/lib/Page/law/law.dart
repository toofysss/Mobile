import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/law.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/Page/law/lawsearch.dart';
import 'package:law/Page/law/searchlaw.dart';
import 'package:law/class/law.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customsearchtext.dart';
import 'package:law/widget/customtext.dart';

class LawController extends GetxController {
  TextEditingController search = TextEditingController();

  void searchdata(
    String text,
  ) {
    LawClass.filteredlaw = LawClass.data
        .where((e) => e.dscrp!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    update();
  }
}

class Law extends StatelessWidget {
  const Law({super.key});
  @override
  Widget build(BuildContext context) {
    LawController controller = Get.put(LawController());
    return GetBuilder<LawController>(
        init: controller,
        builder: (controller) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                  width: Get.width,
                  child: CustomTextSearch(
                      controller: controller.search,
                      hints: "6".tr,
                      onChanged: (text) => controller.searchdata(text),
                      showsearch: true,
                      title: ""),
                ),
                CustomCardLaw(
                  widget: GestureDetector(
                      child: Center(
                        child: CustomText(
                            color: Theme.of(context).primaryColor,
                            data: "95".tr,
                            size: Root.textsize - 2,
                            textOverflow: TextOverflow.clip),
                      ),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        List<LawsData> data = [];
                        for (int i = 0; i < LawClass.data.length; i++) {
                          data.add(LawClass.data[i]);
                        }
                        Get.to(() => Search(item: data),
                            transition: Transition.fadeIn);
                      }),
                ),
                SizedBox(
                    height: Get.height,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: LawClass.filteredlaw.length,
                        itemBuilder: (context, index) {
                          var item = LawClass.filteredlaw[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => LawSearch(
                                        item: item.details!,
                                        header: "${item.dscrp}",
                                      ),
                                  transition: Transition.fadeIn);
                              FocusScope.of(context).unfocus();
                            },
                            child: CustomCardLaw(
                              widget: Center(
                                  child: CustomText(
                                      color: Theme.of(context).primaryColor,
                                      data: '${item.dscrp}',
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip)),
                            ),
                          );
                        })),
              ],
            ),
          );
        });
  }
}
