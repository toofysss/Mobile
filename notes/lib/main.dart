import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/constant/home.dart';
import 'package:notes/constant/opeartion.dart';
import 'package:notes/operation/operationtitle.dart';
import 'package:notes/views/homescreen.dart';
import 'package:notes/widget/customtext.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageFiltered(
          imageFilter:
              ImageFilter.blur(sigmaX: Root.sigmax, sigmaY: Root.sigmay),
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Root.bgimage), fit: BoxFit.fill)),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () => Get.to(() => const OperationTitle(),
                transition: Transition.fade),
            child: Container(
              decoration: BoxDecoration(
                  gradient: Root.gradient, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Root.bg,
                  size: Root.iconsize + 5,
                ),
              ),
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: CusomtText(
              data: "اللغات",
              size: Root.headersize,
              color: Root.bg,
            ),
          ),
          body: StreamBuilder(
              stream: HomeScreenClass.viewimage.snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 180,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onDoubleTap: () => OperationClass.showNotification(
                                () => OperationClass.deleteopeartion(
                                    false, snapshot.data!.docs[index].id, "")),
                            onTap: () => Get.to(
                                () => Homes(
                                      id: snapshot.data.docs[index].id,
                                    ),
                                transition: Transition.fade),
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 170,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(.13)),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.white.withOpacity(.15),
                                      Colors.white.withOpacity(.05),
                                    ],
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(snapshot
                                          .data.docs[index]
                                          .data()['images']))),
                            ));
                      });
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: Root.bg,
                ));
              }),
        ),
      ],
    );
  }
}
