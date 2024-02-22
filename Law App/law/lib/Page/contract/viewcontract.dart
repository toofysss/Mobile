import 'package:flutter/material.dart';
import 'package:law/Data/contact.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customtext.dart';

class ContractPdf extends StatelessWidget {
  final String title;
  const ContractPdf({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          centerTitle: true,
          leading: const BackPageButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustomText(
              color: Theme.of(context).appBarTheme.foregroundColor!,
              data: title,
              size: Root.textsize,
              textOverflow: TextOverflow.ellipsis)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                ContactClass.contractpdf.length,
                (index) => GestureDetector(
                    onTap: ContactClass.contractpdf[index].ontap,
                    child: CustomCardLaw(
                        widget: Center(
                            child: CustomText(
                                color: Theme.of(context).primaryColor,
                                data: ContactClass.contractpdf[index].title,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip))))),
          ),
        ),
      ),
    );
  }
}
