import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:quran/constant/root.dart';
import 'dart:math';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class QiblaController extends GetxController {
  double latitudeQibla = 21.422487;
  double longitudeQibla = 39.826206;
  String? space;
  @override
  void onInit() {
    space = (Geolocator.distanceBetween(
                Root.latitude, Root.longitude, latitudeQibla, longitudeQibla) /
            1000)
        .toStringAsFixed(1);
    super.onInit();
  }
}

class QiblaPage extends StatefulWidget {
  const QiblaPage({super.key});

  @override
  State<QiblaPage> createState() => _QiblaPageState();
}

class _QiblaPageState extends State<QiblaPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? _animationController;
  double begin = 0.0;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QiblaController>(
        init: QiblaController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Text("S12".tr),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                  size: Root.iconsize - 3,
                ),
              ),
            ),
            body: StreamBuilder(
              stream: FlutterQiblah.qiblahStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ));
                }

                final qiblahDirection = snapshot.data;
                animation = Tween(
                        begin: begin,
                        end: (qiblahDirection!.qiblah * (pi / 180) * -1))
                    .animate(_animationController!);
                begin = (qiblahDirection.qiblah * (pi / 180) * -1);
                _animationController!.forward(from: 0);

                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width * .9,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context)
                                .bottomNavigationBarTheme
                                .backgroundColor,
                            border: Border.all(
                              width: 2.5,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                                offset: const Offset(0, 0),
                                color: Theme.of(context).colorScheme.shadow,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: Get.width / 2.5,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "14".tr,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Transform.rotate(
                                angle: -50,
                                child: Container(
                                  height: 40,
                                  width: 2.5,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              Text(
                                "${controller.space} ${"11".tr}",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70, bottom: 10),
                          child: Text("${qiblahDirection.direction.toInt()}°",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Root.fontsize)),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(Root.cadrantimg,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                AnimatedBuilder(
                                  animation: animation!,
                                  builder: (context, child) => Transform.rotate(
                                      angle: animation!.value,
                                      child: Image.asset(Root.compassimg,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                ),
                              ],
                            ))
                      ]),
                );
              },
            ),
          );
        });
  }
}
