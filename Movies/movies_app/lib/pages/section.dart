import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Data/api.dart';
import 'package:movies_app/Data/home.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customloading.dart';
import 'package:movies_app/widget/customtext.dart';
import 'package:movies_app/Design/viewsection.dart';

class Section extends StatelessWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context) {
    return DataClass.section.isEmpty
        ? const SizedBox(
            height: 220,
            child: CustomLoading(),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 100,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
            scrollDirection: Axis.vertical,
            itemCount: DataClass.section['genres'].length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
                Get.to(() => ViewSection(
                      data: '${DataClass.section['genres'][index]['name']}',
                    ));
                DataClass.movie = await HomeClass.getDate(
                    "/discover/movie?api_key=${Api.apikey}&with_genres=${DataClass.section['genres'][index]['id']}");
                DataClass.tv = await HomeClass.getDate(
                    "/discover/tv?api_key=${Api.apikey}&with_genres=${DataClass.section['genres'][index]['id']}");
                Get.forceAppUpdate();
              },
              child: Container(
                width: 150,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(.13)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(.15),
                      Colors.white.withOpacity(.05),
                    ],
                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 7),
                child: Center(
                      child: CustomText(
                          colors: Root.textcolor,
                          data: "${DataClass.section['genres'][index]['name']}",
                          size: Root.textsize + 5,
                          textOverflow: TextOverflow.clip),
                    )
              ),
            ),
          );
  }
}
