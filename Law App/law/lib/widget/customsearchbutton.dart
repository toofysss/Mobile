import 'package:flutter/material.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/contant/root.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Data.isSearching ? Icons.close : Icons.search,
          size: Root.iconsSize,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
