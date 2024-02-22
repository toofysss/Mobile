import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/widget/custombackbutton.dart';
import 'package:quran/widget/customtext.dart';

class DuaaDesign extends StatelessWidget {
  final String title;
  final String dscrp;
  const DuaaDesign({required this.dscrp, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
          () => DuaaDetails(
                dscrp: dscrp,
                title: title,
              ),
          transition: Transition.fadeIn,
          curve: Curves.fastOutSlowIn),
      child: Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              width: 1.5,
              color: Theme.of(context).buttonTheme.colorScheme!.primary),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: CustomText(
              color: Theme.of(context).secondaryHeaderColor,
              size: Root.fontsize,
              title: title),
        ),
      ),
    );
  }
}

class DuaaDetails extends StatelessWidget {
  final String dscrp;
  final String title;
  const DuaaDetails({required this.title, required this.dscrp, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: CustomBackButtom(),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: CustomText(
                        color: Theme.of(context).secondaryHeaderColor,
                        size: Root.headersize,
                        title: title),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.5),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: CustomQuranText(
                    color: Theme.of(context).secondaryHeaderColor,
                    size: Root.fontsize,
                    title: dscrp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
