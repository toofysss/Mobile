// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customtext.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(Root.logo), fit: BoxFit.fill)),
          ),
          Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
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
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    ProfileClassData.profileClassData.length,
                    (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: ProfileClassData
                                    .profileClassData[index].ontap,
                                child: ListTile(
                                  title: CustomText(
                                    colors: Root.textcolor,
                                    data: ProfileClassData
                                        .profileClassData[index].title,
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  leading: Icon(
                                    ProfileClassData
                                        .profileClassData[index].iconData,
                                    size: Root.iconsize +10,
                                    color:Colors.white,
                                  ),
                                )),
                            Visibility(
                              visible: index <
                                  ProfileClassData.profileClassData.length - 1,
                              child: Divider(
                                indent: 45,
                                endIndent: 45,
                                color: Root.colorSeclectBottom,
                              ),
                            ),
                          ],
                        )),
              )),
        ],
      ),
    );
  }
}
