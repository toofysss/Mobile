import 'package:flutter/material.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customtext.dart';

class SettingDesign extends StatelessWidget {
  final Function()? ontap;
  final bool divider;
  final String title;
  final IconData iconData;
  const SettingDesign(
      {required this.divider,
      required this.iconData,
      required this.ontap,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: ontap,
            child: ListTile(
              title: CustomText(
                colors: Root.textcolor,
                data: title,
                size: Root.textsize,
                textOverflow: TextOverflow.ellipsis,
              ),
              leading: Icon(
                iconData,
                size: Root.iconsize + 10,
                color: Colors.white,
              ),
            )),
        Visibility(
          visible: divider,
          child: Divider(
            indent: 45,
            endIndent: 45,
            color: Root.colorSeclectBottom,
          ),
        ),
      ],
    );
  }
}
