import 'package:flutter/material.dart';
import 'package:quran/constant/home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: List.generate(
            HomeClass.bottomList.length,
            (index) => Icon(
                  HomeClass.bottomList[index],
                  size: 35,
                  color: const Color(0xff672ebb),
                )),
      ),
    );
  }
}
