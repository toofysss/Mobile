import 'package:flutter/material.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customtext.dart';

class CustomSettingDesign extends StatelessWidget {
  final bool visible;
  final bool divider;
  final Function()? ontap;
  final IconData iconData;
  final String title;

  const CustomSettingDesign(
      {required this.iconData,
      required this.visible,
      required this.divider,
      required this.ontap,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: visible,
          child: GestureDetector(
            onTap: ontap,
            child: ListTile(
              leading: Icon(
                iconData,
                color: Theme.of(context).primaryColor,
                size: 35,
              ),
              title: CustomText(
                color: Theme.of(context).primaryColor,
                data: title,
                size: Root.textsize,
                textOverflow: TextOverflow.clip,
              ),
            ),
          ),
        ),
        Visibility(
          visible: divider,
          child: Divider(
            endIndent: 35,
            indent: 35,
            thickness: 1.5,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
