// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:law/Page/blog/blogdetails.dart';

// class CustomBlogCard extends StatelessWidget {
//   final BlogDetailsData blogItem;
//   const CustomBlogCard({required this.blogItem, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.to(() => BlogDetails(item: blogItem),
//           transition: Transition.fadeIn),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Root.headercolor,
//         ),
//         margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: CachedNetworkImage(
//                   imageUrl: "${ApiClass.api}/BlogControll/${blogItem.img}",
//                   fit: BoxFit.fill,
//                   width: 150,
//                   height: 150,
//                   placeholder: (context, url) => const SizedBox(
//                       width: 150, height: 150, child: Customloading()),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin:
//                         const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                     child: CustomText(
//                         color: Root.tabtextcolor,
//                         data: "${blogItem.title}",
//                         size: Root.textsize,
//                         textOverflow: TextOverflow.ellipsis),
//                   ),
//                   Container(
//                     margin:
//                         const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
//                     child: CustomText(
//                         color: Root.tabtextcolor,
//                         data: "${blogItem.date}",
//                         size: Root.textsize - 2,
//                         textOverflow: TextOverflow.ellipsis),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
