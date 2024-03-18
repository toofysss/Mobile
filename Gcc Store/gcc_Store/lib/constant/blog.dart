import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gcc/constant/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BlogClass {
  static final CarouselController carouselController = CarouselController();
  static int currentIndex = 0;
  static double heightCarousel = Get.height / 4.5;

  static Future getblog() async {
    try {
      var response = await http.get(
        Uri.parse(ApiClass.api),
      );
      var responseData = jsonDecode(response.body);
      return responseData;
    } catch (e) {
      debugPrint("Exception: $e");
    }
  }
}
