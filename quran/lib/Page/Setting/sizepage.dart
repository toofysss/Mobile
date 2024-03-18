import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/services/services.dart';

class SizePageController extends GetxController {
  MyServices myServices = Get.find();

  void onchange(double size) {
    Root.fontsize = size;
    myServices.sharedPreferences.setDouble("Size", size);
    update();
  }
}

class SizePage extends StatelessWidget {
  const SizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SizePageController>(
        init: SizePageController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Text("Setting3".tr),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                  size: Root.iconsize - 3,
                ),
              ),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Row(
                      children: [
                        Text(
                          "A",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Slider(
                              inactiveColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.4),
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              thumbColor: Theme.of(context).colorScheme.primary,
                              label: Root.fontsize.toString(),
                              onChangeEnd: (value) => Get.forceAppUpdate(),
                              min: 12,
                              max: 45,
                              value: Root.fontsize,
                              onChanged: (value) => controller.onchange(value)),
                        ),
                        Text(
                          "A",
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      // height: 150,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 1.5,
                              color: Theme.of(context).primaryColor)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "۞ جَعَلَ ٱللَّهُ ٱلۡكَعۡبَةَ ٱلۡبَيۡتَ ٱلۡحَرَامَ قِيَٰمٗا لِّلنَّاسِ وَٱلشَّهۡرَ ٱلۡحَرَامَ وَٱلۡهَدۡيَ وَٱلۡقَلَٰٓئِدَۚ ذَٰلِكَ لِتَعۡلَمُوٓاْ أَنَّ ٱللَّهَ يَعۡلَمُ مَا فِي ٱلسَّمَٰوَٰتِ وَمَا فِي ٱلۡأَرۡضِ وَأَنَّ ٱللَّهَ بِكُلِّ شَيۡءٍ عَلِيمٌ",
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: Root.fontsize,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
