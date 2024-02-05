import 'package:books/constant/root.dart';
import 'package:books/constant/setting.dart';
import 'package:books/widget/customtext.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.only(top: 30, right: 25, left: 25),
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          Root.logo,
                        ),
                        fit: BoxFit.fill)),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ),
                borderRadius: BorderRadius.circular(29),
                border: Border.all(color: Theme.of(context).cardColor),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 5,
                    color: Theme.of(context).shadowColor,
                  ),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                      SettingPages.settingData.length,
                      (index) => Column(
                            children: [
                              GestureDetector(
                                onTap: SettingPages.settingData[index].ontap,
                                child: ListTile(
                                  title: CustomText(
                                      color: Theme.of(context).focusColor,
                                      size: Root.fontsize + 6,
                                      data: SettingPages
                                          .settingData[index].title),
                                  leading: Icon(
                                    SettingPages.settingData[index].iconData,
                                    color: Theme.of(context).iconTheme.color,
                                    size: Root.iconsize + 8,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible:
                                    index < SettingPages.settingData.length - 1,
                                child: Divider(
                                  indent: 45,
                                  endIndent: 45,
                                  color: ThemeDataClass.grey,
                                ),
                              ),
                            ],
                          ))),
            )
          ],
        ),
      
    );
  }
}
