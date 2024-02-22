import 'package:books/Design/favouritecard.dart';
import 'package:books/constant/data.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DataClass.favourite.isNotEmpty
                ? Center(
                    child: FavouriteCard(
                      favouriteBook: DataClass.favourite,
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }
}
