import 'package:flutter/material.dart';
import 'package:movies_app/widget/customimage.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customtext.dart';

class CustomDesignCard extends StatelessWidget {
  final Function()? onTap;
  final String name;
  final String image;
  final String year;
  final String rate;

  const CustomDesignCard(
      {required this.image,
      required this.name,
      required this.onTap,
      required this.rate,
      required this.year,
      super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withOpacity(.13)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(.15),
              Colors.white.withOpacity(.05),
            ],
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 7),
        child:  Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CustomImage(height: 150, image: image)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CustomText(
                    textOverflow: TextOverflow.ellipsis,
                    colors: Root.textcolor,
                    data: name,
                    size: Root.textsize - 3),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          textOverflow: TextOverflow.ellipsis,
                          colors: Root.textcolor,
                          data: year,
                          size: Root.textsize - 3),
                      Row(
                        children: [
                          CustomText(
                              textOverflow: TextOverflow.ellipsis,
                              colors: Root.textcolor,
                              data: rate,
                              size: Root.textsize - 3),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: Root.iconsize,
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        
      ),
    );
  }
}
