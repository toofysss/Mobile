import 'package:flutter/material.dart';
import 'package:law/Data/blog.dart';
import 'package:law/class/blog.dart';
import 'package:law/widget/customblogcard.dart';
import 'package:law/widget/customcarouselblog.dart';
import 'package:law/widget/customloading.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
          future: BlogClass.getYourRightData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return const Customloading();
              }
              var count = snapshot.data[0]['details'].length > 5
                  ? 5
                  : snapshot.data[0]['details'].length;
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    snapshot.data[0]['details'].length == 0
                        ? const Customloading()
                        : CustomCarouselBlog(
                            items: snapshot.data[0]['details'], count: count),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data[0]['details'].length,
                      itemBuilder: (context, index) {
                        BlogDetailsData blogItem = BlogDetailsData.fromJson(
                            snapshot.data[0]['details'][index]);
                        return snapshot.data[0]['details'].length == 0
                            ? const Customloading()
                            : CustomBlogCard(blogItem: blogItem);
                      },
                    ),
                  ],
                ),
              );
            }
            return const Customloading();
          })
    ;
  }
}
