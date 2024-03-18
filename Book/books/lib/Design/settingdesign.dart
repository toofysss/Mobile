import 'package:books/constant/root.dart';
import 'package:books/widget/customtext.dart';
import 'package:flutter/material.dart';

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
              color: Theme.of(context).focusColor,
              size: Root.fontsize + 6,
              data: title,
            ),
            leading: Icon(
              iconData,
              color: Theme.of(context).iconTheme.color,
              size: Root.iconsize + 8,
            ),
          ),
        ),
        Visibility(
          visible: divider,
          child: Divider(
            indent: 45,
            endIndent: 45,
            color: ThemeDataClass.grey,
          ),
        ),
      ],
    );
  }
}
