import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/constant/home.dart';
import 'package:notes/constant/opeartion.dart';
import 'package:notes/controll/homescreencontroller.dart';
import 'package:notes/views/ditals.dart';
import 'package:notes/widget/customtext.dart';
import 'package:notes/widget/customtextfield.dart';

class Homes extends StatefulWidget {
  final String id;
  const Homes({required this.id, super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  late CollectionReference viewData;
  @override
  void initState() {
    viewData = FirebaseFirestore.instance
        .collection("Data")
        .doc(widget.id)
        .collection("Data");
    super.initState();
  }

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
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () =>
                HomeScreenClass.operation("", "0", false, widget.id),
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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: Root.iconsize,
                  color: Root.bg,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomTextField(
                    controller: HomeScreenClass.searchdata,
                    suffex: GestureDetector(
                      onTap: () => HomeScreenControllerImp()
                          .filterdata(HomeScreenClass.searchdata.text),
                      child: Icon(
                        Icons.search,
                        size: Root.iconsize,
                        color: Colors.black,
                      ),
                    ),
                    lines: 1,
                    hint: "ابحث هنا.....",
                  ),
                ),
                SizedBox(
                  width: Get.width * .9,
                  child: StreamBuilder(
                      stream: viewData.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onDoubleTap: () =>
                                      OperationClass.showNotification(() =>
                                          OperationClass.deleteopeartion(
                                              true,
                                              widget.id,
                                              snapshot.data!.docs[index].id)),
                                  onLongPress: () {
                                    OperationClass.title.text =
                                        snapshot.data!.docs[index]['title'];
                                    OperationClass.subject.text =
                                        snapshot.data!.docs[index]['subject'];
                                    OperationClass.subtitle.text =
                                        snapshot.data!.docs[index]['subtitle'];
                                    HomeScreenClass.operation(
                                        OperationClass.title.text =
                                            snapshot.data!.docs[index]['title'],
                                        widget.id,
                                        true,
                                        snapshot.data!.docs[index].id);
                                  },
                                  onTap: () => Get.to(
                                      () => HomeDitals(
                                            data: snapshot.data!.docs[index]
                                                ['subject'],
                                            title: snapshot.data!.docs[index]
                                                ['title'],
                                          ),
                                      transition: Transition.fadeIn),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 2.5),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: Root.gradient),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: CusomtText(
                                              color: Root.bg,
                                              data:
                                                  "${snapshot.data!.docs[index]['title']}",
                                              size: Root.textsize),
                                        ),
                                        Visibility(
                                          visible: snapshot
                                              .data!.docs[index]['subtitle']
                                              .toString()
                                              .isNotEmpty,
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: CusomtText(
                                                color: Root.bg,
                                                data:
                                                    "${snapshot.data!.docs[index]['subtitle']}",
                                                size: Root.textsize),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Root.bg,
                        ));
                      }),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
