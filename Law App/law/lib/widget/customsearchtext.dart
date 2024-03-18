import 'package:flutter/material.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customtext.dart';

class CustomTextSearch extends StatelessWidget {
  final bool showsearch;
  final Function(String)? onChanged;
  final String title;
  final String hints;
  final TextEditingController controller;
  const CustomTextSearch(
      {required this.controller,
      required this.hints,
      required this.onChanged,
      required this.showsearch,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return showsearch
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: Material(
              elevation: 6,
              shadowColor: Theme.of(context).shadowColor,
              borderRadius: BorderRadius.circular(30),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                    // autofocus: true,
                    controller: controller,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: Root.textsize - 3,
                        color: Root.primary,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintText: hints,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            fontSize: Root.textsize - 3,
                            color: Root.primary,
                            fontWeight: FontWeight.bold)),
                    onChanged: onChanged),
              ),
            ),
          )
        : Center(
            child: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomText(
                color: Theme.of(context).appBarTheme.foregroundColor!,
                data: title,
                size: Root.textsize,
                textOverflow: TextOverflow.ellipsis),
          ));
  }
}
