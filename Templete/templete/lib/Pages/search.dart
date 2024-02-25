import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete/Pages/viewsection.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/widget/customloading.dart';
import 'package:templete/widget/customtext.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    Data.filterjson = Data.json;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FutureBuilder(
        future: Data.getdata(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  width: Get.width * .9,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    showCursor: false,
                    controller: Data.search,
                    style: TextStyle(
                      fontSize: Root.textsize,
                      color: Root.bgprimary,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            Data.filterjson = Data.json.where((item) {
                              return item['section']
                                  .toLowerCase()
                                  .contains(Data.search.text.toLowerCase());
                            }).toList();
                          });
                        },
                        child: Icon(
                          Icons.search,
                          size: Root.iconsize + 5,
                          color: Root.bgprimary,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      labelText: "2".tr,
                      labelStyle: TextStyle(
                        color: Root.bgprimary,
                        fontSize: Root.textsize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 100,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 25,
                  ),
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Data.filterjson.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => ViewSection(
                            image: Data.filterjson[index]['notes'],
                            title: "${Data.filterjson[index]['section']}",
                          )),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: .5,
                            color: Root.textcolor,
                          ),
                        ),
                        child: Center(
                          child: CusomtText(
                            color: Root.textcolor,
                            data: "${Data.filterjson[index]['section']}",
                            size: Root.textsize,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return const Center(child: CustomLoading());
        },
      ),
    );
  }
}
