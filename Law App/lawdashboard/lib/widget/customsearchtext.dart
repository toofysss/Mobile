import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/constant/root.dart';

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
            width: Get.width * (showsearch ? 0.8 : 0.0),
            child: Material(
              elevation: 6,
              shadowColor: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                    autofocus: true,
                    controller: controller,
                    style: TextStyle(
                        fontSize: Root.textsize - 3,
                        color: Root.textcolor,
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
                            color: Root.textcolor,
                            fontWeight: FontWeight.bold)),
                    onChanged: onChanged),
              ),
            ),
          )
        : Center(
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Root.headercolor,
                      fontSize: Root.headersize),
                )));
  }
}
