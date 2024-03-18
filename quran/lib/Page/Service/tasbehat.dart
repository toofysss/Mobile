import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';
import 'package:flutter/services.dart';

class Vibration {
  static const MethodChannel _channel = MethodChannel('vibration');

  static Future<void> vibrate({
    int duration = 500,
    List<int> pattern = const [],
    int repeat = -1,
    List<int> intensities = const [],
    int amplitude = -1,
  }) =>
      _channel.invokeMethod(
        "vibrate",
        {
          "duration": duration,
          "pattern": pattern,
          "repeat": repeat,
          "amplitude": amplitude,
          "intensities": intensities
        },
      );
}

class TasbeehController extends GetxController {
  int i = 0;
  int tasbehatindex = 0;
  int tasbehatcount = 0;
  int count = 0;
  String title = "";
  getdata() {
    if (i == 0) {
      count = TasbehatList.tasbehatList[0].count!;
    } else if (i == 1) {
      count = TasbehatList.tasbehatAlzahraList[0].count!;
      title = Root.lang == "en"
          ? TasbehatList.tasbehatAlzahraList[0].nameE!
          : TasbehatList.tasbehatAlzahraList[0].nameA!;
    }
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  void changepage(int currentPage) {
    i = currentPage;
    reset();
    getdata();
    update();
  }

  void changetasbehat(int tasbehat) {
    tasbehatindex = tasbehat;
    if (i == 0) {
      count = TasbehatList.tasbehatList[tasbehatindex].count!;
    } else if (i == 1) {
      if (tasbehatindex == TasbehatList.tasbehatAlzahraList.length) {
        count = TasbehatList.tasbehatAlzahraList[0].count!;
        tasbehatindex = 0;
        title = Root.lang == "en"
            ? TasbehatList.tasbehatAlzahraList[0].nameE!
            : TasbehatList.tasbehatAlzahraList[0].nameA!;
      } else {
        count = TasbehatList.tasbehatAlzahraList[tasbehatindex].count!;
        title = Root.lang == "en"
            ? TasbehatList.tasbehatAlzahraList[tasbehatindex].nameE!
            : TasbehatList.tasbehatAlzahraList[tasbehatindex].nameA!;
      }
    }
    update();
  }

  void changeCounting() async {
    if (tasbehatcount >= count) {
      tasbehatcount = 0;
      tasbehatindex++;
      changetasbehat(tasbehatindex++);
      Vibration.vibrate();
    } else {
      tasbehatcount++;
    }
    update();
  }

  reset() {
    tasbehatcount = 0;
    tasbehatindex = 0;
    update();
  }
}

class TasbeehPage extends StatefulWidget {
  const TasbeehPage({super.key});

  @override
  State<TasbeehPage> createState() => _TasbeehPageState();
}

class _TasbeehPageState extends State<TasbeehPage>
    with TickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(seconds: 4), lowerBound: .2);
  late AnimationController animationControllertext = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );
  @override
  void initState() {
    animationController.addListener(() {
      setState(() {});
    });
    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(animationControllertext);

    animationControllertext.forward();
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    animationControllertext.dispose();
    super.dispose();
  }

  Widget ripplecontainer(double e) {
    return Container(
      width: e * animationController.value,
      height: e * animationController.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(1.0 - animationController.value)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasbeehController>(
        init: TasbeehController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                title: Text("S9".tr),
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
              body: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (value) => controller.changepage(value),
                      unselectedLabelColor:
                          Theme.of(context).primaryColor.withOpacity(.7),
                      tabs: [
                        Tab(
                          text: "Tasbeeh0".tr,
                        ),
                        Tab(
                          text: "Tasbeeh1".tr,
                        ),
                        Tab(
                          text: "Tasbeeh2".tr,
                        ),
                      ],
                      labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Root.fontsize,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: Get.height / 4,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: TasbehatList.tasbehatList.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () => controller.changetasbehat(
                                      index,
                                    ),
                                    child: Container(
                                      width: 250,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 15,
                                            offset: const Offset(0, 0),
                                            color:
                                                Theme.of(context).shadowColor,
                                          )
                                        ],
                                        border: Border.all(
                                            width: 1.5,
                                            color: controller.tasbehatindex ==
                                                    index
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : Colors.transparent),
                                      ),
                                      child: Text(
                                        Root.lang == "en"
                                            ? TasbehatList
                                                .tasbehatList[index].nameE!
                                            : TasbehatList
                                                .tasbehatList[index].nameA!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: Root.fontsize,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${controller.count} / ${controller.tasbehatcount}",
                                        style: TextStyle(
                                            fontSize: Root.fontsize,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      GestureDetector(
                                        onTap: () => controller.reset(),
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.5,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          child: Text(
                                            "13".tr,
                                            style: TextStyle(
                                                fontSize: Root.fontsize,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.changeCounting(),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 30),
                                    width: Get.width,
                                    color: Colors.transparent,
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ripplecontainer(150),
                                          ripplecontainer(200),
                                          ripplecontainer(250),
                                          ripplecontainer(300),
                                          ripplecontainer(350),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.5,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                            child: Text(
                                              "12".tr,
                                              style: TextStyle(
                                                  fontSize: Get.width / 18,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Center(
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  width: 200,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 15,
                                          offset: const Offset(0, 0),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow,
                                        )
                                      ],
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          width: 1.5,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  child: Column(
                                    children: [
                                      SlideTransition(
                                        position: _animation,
                                        child: Text(
                                          controller.title,
                                          style: TextStyle(
                                            fontSize: Root.fontsize,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        thickness: 1.5,
                                        endIndent: 25,
                                        indent: 25,
                                      ),
                                      Text(
                                        "${controller.count} / ${controller.tasbehatcount}",
                                        style: TextStyle(
                                            fontSize: Root.fontsize,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (controller.tasbehatcount >=
                                          controller.count) {
                                        animationControllertext.forward();
                                        controller.changeCounting();
                                      } else {
                                        controller.changeCounting();
                                      }
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 30),
                                      width: Get.width,
                                      color: Colors.transparent,
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            ripplecontainer(150),
                                            ripplecontainer(200),
                                            ripplecontainer(250),
                                            ripplecontainer(300),
                                            ripplecontainer(350),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1.5,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                                shape: BoxShape.circle,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                              child: Text(
                                                "12".tr,
                                                style: TextStyle(
                                                    fontSize: Get.width / 18,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  width: 100,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 15,
                                          offset: const Offset(0, 0),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .shadow,
                                        )
                                      ],
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          width: 1.5,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  child: Text(
                                    "${controller.tasbehatcount}",
                                    style: TextStyle(
                                        fontSize: Root.fontsize,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: () => controller.changeCounting(),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 30),
                                      width: Get.width,
                                      color: Colors.transparent,
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            ripplecontainer(150),
                                            ripplecontainer(200),
                                            ripplecontainer(250),
                                            ripplecontainer(300),
                                            ripplecontainer(350),
                                            Container(
                                              alignment: Alignment.center,
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1.5,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                                shape: BoxShape.circle,
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                              child: Text(
                                                "12".tr,
                                                style: TextStyle(
                                                    fontSize: Get.width / 18,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
