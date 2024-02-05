import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/blog.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Page/blog/news.dart';
import 'package:law/class/blog.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/customblogcard.dart';
import 'package:law/widget/customcarouselblog.dart';
import 'package:law/widget/customloading.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Root.backgroundApp,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                GestureDetector(
                  onTap: () async {
                    if (Data.laweysID.text.isEmpty) {
                      return AlertClass.success("108".tr);
                    }
                    Get.to(() => const News(), transition: Transition.fadeIn);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Root.primary, shape: BoxShape.circle),
                    child: Center(
                        child: Icon(
                      Icons.add,
                      size: Root.iconsSize + 5,
                      color: Root.secondry,
                    )),
                  ),
                ),
              ],
            ),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: FutureBuilder(
                  future: BlogClass.getYourRightData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length == 0) {
                        return const Customloading();
                      }
                      var count = snapshot.data[0]['details'].length > 5
                          ? 5
                          : snapshot.data[0]['details'].length;
                      var countlaweyrs = snapshot.data[1]['details'].length > 5
                          ? 5
                          : snapshot.data[1]['details'].length;
                      return Column(children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: Root.primary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TabBar(
                              labelColor: Colors.white,
                              overlayColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.transparent),
                              indicator: BoxDecoration(
                                color: Root.secondry.withOpacity(.15),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              unselectedLabelColor: Root.secondry,
                              tabs: [
                                Tab(
                                  child: SizedBox(
                                    width: Get.width,
                                    child: Center(
                                      child: Text(
                                        "8".tr,
                                        style:
                                            TextStyle(fontSize: Get.width / 20),
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: SizedBox(
                                    width: Get.width,
                                    child: Center(
                                      child: Text(
                                        "9".tr,
                                        style:
                                            TextStyle(fontSize: Get.width / 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Expanded(
                            child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    snapshot.data[0]['details'].length == 0
                                        ? const Customloading()
                                        : CustomCarouselBlog(
                                            items: snapshot.data[0]['details'],
                                            count: count),
                                    ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          snapshot.data[0]['details'].length,
                                      itemBuilder: (context, index) {
                                        BlogDetailsData blogItem =
                                            BlogDetailsData.fromJson(snapshot
                                                .data[0]['details'][index]);
                                        return snapshot.data[0]['details']
                                                    .length ==
                                                0
                                            ? const Customloading()
                                            : CustomBlogCard(
                                                blogItem: blogItem);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    snapshot.data[0]['details'].length == 0
                                        ? const Customloading()
                                        : CustomCarouselBlog(
                                            items: snapshot.data[1]['details'],
                                            count: countlaweyrs),
                                    ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          snapshot.data[1]['details'].length,
                                      itemBuilder: (context, index) {
                                        BlogDetailsData blogItem =
                                            BlogDetailsData.fromJson(snapshot
                                                .data[1]['details'][index]);
                                        return snapshot.data[0]['details']
                                                    .length ==
                                                0
                                            ? const Customloading()
                                            : CustomBlogCard(
                                                blogItem: blogItem);
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ]))
                      ]);
                    }
                    return const Customloading();
                  }),
            ),
          ),
        ));
  }
}
