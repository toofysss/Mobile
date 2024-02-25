import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/operation/addsection.dart';
import 'package:templete/widget/customloading.dart';
import 'package:templete/widget/customtext.dart';

class EditSection extends StatelessWidget {
  const EditSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.bg,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: CusomtText(
            data: "8".tr,
            size: Root.textsize,
            color: Root.textcolor,
          ),
        ),
        body: FutureBuilder(
          future: Data.getdata(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 100,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 25),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        OperationClass.section.text =
                            snapshot.data[index]['section'];
                        OperationClass.sectionID = snapshot.data[index]['id'];
                        Get.to(
                            () => AddSection(
                                  edit: true,
                                  hint: "8".tr,
                                ),
                            transition: Transition.fadeIn);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(width: .5, color: Root.textcolor)),
                        child: Center(
                            child: CusomtText(
                                color: Root.textcolor,
                                data: "${snapshot.data[index]['section']}",
                                size: Root.textsize)),
                      ),
                    );
                  });
            }
            return const CustomLoading();
          },
        ),
      ),
    );
  }
}
