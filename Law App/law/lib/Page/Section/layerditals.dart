import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Page/services/consultation.dart';
import 'package:law/contant/config.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';

class LayerDetails extends StatelessWidget {
  final Map item;
  final String goverment;
  const LayerDetails({required this.item, required this.goverment, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Root.backgroundApp,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: CustomText(
                  color: Root.primary,
                  data: item['name'],
                  size: Root.headersize,
                  textOverflow: TextOverflow.clip),
              leading: const BackPageButton()),
          body: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Root.backgroundApp,
            ),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                  "${Config.api}/LaweysControll/${item['img']}",
                                  headers: const {"accept": "*/*"},
                                ))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Root.primary),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.userTie,
                            size: Root.headersize + 5,
                            color: Root.secondry,
                          ),
                        ),
                      ),
                      title: CustomText(
                          color: Root.primary,
                          data: "${item['name']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Root.primary),
                        child: Center(
                          child: Icon(
                            Icons.location_on_sharp,
                            size: Root.headersize + 5,
                            color: Root.secondry,
                          ),
                        ),
                      ),
                      title: CustomText(
                          color: Root.primary,
                          data: "$goverment - ${item['city']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Root.primary),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.userTag,
                            size: Root.headersize + 5,
                            color: Root.secondry,
                          ),
                        ),
                      ),
                      title: CustomText(
                          color: Root.primary,
                          data: "${item['depart']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Root.primary),
                        child: Center(
                          child: Icon(
                            Icons.group_sharp,
                            size: Root.headersize + 5,
                            color: Root.secondry,
                          ),
                        ),
                      ),
                      title: CustomText(
                          color: Root.primary,
                          data: "${item['room']}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    height: 400,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1.5, color: Root.primary)),
                    child: ScrollbarTheme(
                      data: ScrollbarThemeData(
                        thumbColor:
                            MaterialStateProperty.all<Color>(Root.primary),
                      ),
                      child: Scrollbar(
                        radius: const Radius.circular(50),
                        thickness: 1.5,
                        trackVisibility: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: CustomText(
                              color: Root.primary,
                              data: "${item['dscrp']}",
                              size: Root.textsize,
                              textOverflow: TextOverflow.clip),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => Data.urllauncher(
                              "https://wa.me/964${item['phone']}"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              size: Root.iconsSize + 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Data.urllauncher("tel:${item['phone']}"),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Root.primary),
                            child: Icon(
                              FontAwesomeIcons.phone,
                              size: Root.iconsSize + 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: Get.width * .8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1.5, color: Colors.white)),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomButton(
                          data: "10".tr,
                          ontap: () => Get.to(
                              () => Consultation(userID: "${item['id']}"),
                              transition: Transition.fadeIn)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
