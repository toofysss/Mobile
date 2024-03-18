// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom1.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom10.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom11.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom12.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom13.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom14.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom15.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom16.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom17.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom18.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom2.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom3.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom4.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom5.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom6.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom7.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom8.dart';
// import 'package:templete/Temp/BottomNavigationBar/bottom9.dart';
// import 'package:templete/constant/constant.dart';

// class Temp {
//   String image;
//   Function() ontap;
//   Temp({
//     required this.image,
//     required this.ontap,
//   });
// }

// class IconList {
//   IconData? icons;
//   String title;
//   IconList({required this.icons, required this.title});
// }

// class BottomNavBarClass {
//   static String imagehome = "${Root.locimage}/Temp/bottom";
//   static List<Temp> itmes = [
//     Temp(
//         image: "$imagehome/bottom1.png",
//         ontap: () => Get.to(
//             () => const BottomNav1(
//                   title: 'Custom Bottom',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom2.png",
//         ontap: () => Get.to(
//             () => const Bottom2(
//                   title: 'animated_bottom_navigation_bar ',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom3.png",
//         ontap: () => Get.to(
//             () => const Bottom3(
//                   title: 'salomon_bottom_bar ',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom4.png",
//         ontap: () => Get.to(
//             () => const Bottom4(
//                   title: 'dot_navigation_bar',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom5.png",
//         ontap: () => Get.to(
//             () => const Bottom5(
//                   title: 'molten_navigationbar_flutter',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom6.png",
//         ontap: () => Get.to(
//             () => const Bottom6(
//                   title: 'scroll_to_hide_bottom_navigation_bar',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom7.png",
//         ontap: () => Get.to(
//             () => const Bottom7(
//                   title: 'circle_nav_bar',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom8.png",
//         ontap: () => Get.to(
//             () => const Bottom8(
//                   title: 'floating_navigation_bar',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom9.png",
//         ontap: () => Get.to(
//             () => const Bottom9(
//                   title: 'dot_bottom_nav',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom10.png",
//         ontap: () => Get.to(
//             () => const Bottom10(
//                   title: 'spincircle_bottom_bar',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom11.png",
//         ontap: () => Get.to(
//             () => const Bottom11(
//                   title: 'ff_navigation_bar_plus',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom12.png",
//         ontap: () => Get.to(
//             () => const Bottom12(
//                   title: 'water_drop_nav_bar',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom13.png",
//         ontap: () => Get.to(
//             () => const Bottom13(
//                   title: 'sliding_clipped_nav_bar',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom14.png",
//         ontap: () => Get.to(
//             () => const Bottom14(
//                   title: 'google_nav_bar',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom15.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 1',
//                   navBarStyle: NavBarStyle.style1,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom16.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 2',
//                   navBarStyle: NavBarStyle.style2,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom17.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 3',
//                   navBarStyle: NavBarStyle.style3,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom17.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 4',
//                   navBarStyle: NavBarStyle.style4,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom18.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 7',
//                   navBarStyle: NavBarStyle.style7,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom19.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 9',
//                   navBarStyle: NavBarStyle.style9,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom20.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 10',
//                   navBarStyle: NavBarStyle.style10,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom21.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 11',
//                   navBarStyle: NavBarStyle.style11,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom22.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 12',
//                   navBarStyle: NavBarStyle.style12,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom23.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 13',
//                   navBarStyle: NavBarStyle.style13,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom24.png",
//         ontap: () => Get.to(
//             () => const Bottom15(
//                   title: 'persistent_bottom_nav_bar 14',
//                   navBarStyle: NavBarStyle.style14,
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom25.png",
//         ontap: () => Get.to(
//             () => const Bottom16(
//                   title: 'circular_bottom_navigation',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom26.png",
//         ontap: () => Get.to(
//             () => const Bottom17(
//                   title: 'bottom_navy_bar',
//                 ),
//             transition: Transition.fadeIn)),
//     Temp(
//         image: "$imagehome/bottom27.png",
//         ontap: () => Get.to(
//             () => const Bottom18(
//                   title: 'curved_navigation_bar',
//                 ),
//             transition: Transition.fadeIn)),
//   ];
// }

// class BottomNav1Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = Colors.teal;
//   static Color colorunselected = Colors.white;
// }

// class BottomNav2Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = Colors.white;
// }

// class BottomNav3Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = Colors.black;
// }

// class BottomNav4Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav5Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav6Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav7Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav8Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav9Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav10Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav11Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav12Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav13Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.layers, title: "Section"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.person, title: "Account"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav14Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav15Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav16Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav17Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
//   static Color colorselect = const Color(0xff363062);
//   static Color colorunselected = const Color(0xff232D3F);
// }

// class BottomNav18Class {
//   static List<IconList> iconList = [
//     IconList(icons: Icons.home, title: "Home"),
//     IconList(icons: Icons.search, title: "Search"),
//     IconList(icons: Icons.settings, title: "Setting"),
//     IconList(icons: Icons.favorite, title: "Favourite"),
//   ];
//   static int bottom1 = 1;
// }
