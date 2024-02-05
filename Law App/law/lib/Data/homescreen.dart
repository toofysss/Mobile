import 'dart:io';
import 'package:docx_template/docx_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

class ListBottom {
  String title;
  IconData iconData;
  ListBottom({
    required this.title,
    required this.iconData,
  });
}

class Data {
  static bool online = true;
  static bool isSearching = false;
  static TextEditingController laweysID = TextEditingController();
  static List<ListBottom> listitem = [
    ListBottom(title: "1".tr, iconData: Icons.balance_outlined),
    ListBottom(title: "2".tr, iconData: FontAwesomeIcons.newspaper),
    ListBottom(title: "4".tr, iconData: FontAwesomeIcons.userTie),
    ListBottom(title: "5".tr, iconData: FontAwesomeIcons.layerGroup),
    ListBottom(title: "25".tr, iconData: FontAwesomeIcons.gear),
  ];

  static urllauncher(String url) async {
    if (online) {
      await launchUrl(Uri.parse(url));
    } else {
      return AlertClass.error("50".tr);
    }
  }

  static List<TextSpan> highlightOccurrences(String source, String query) {
    if (query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
      return [TextSpan(text: source)];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));
      }

      children.add(TextSpan(
        text: source.substring(match.start, match.end),
        style: TextStyle(
            backgroundColor: Colors.yellow,
            color: Colors.black,
            fontSize: Root.textsize,
            fontWeight: FontWeight.bold),
      ));

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(TextSpan(
          text: source.substring(match.end, source.length),
        ));
      }

      lastMatchEnd = match.end;
    }
    return children;
  }

  static getdoc(String details) async {
    final ByteData data = await rootBundle.load("image/template.docx");
    final List<int> bytes = data.buffer.asUint8List();
    final docx = await DocxTemplate.fromBytes(bytes);

    Content c = Content();
    c.add(ListContent("multilineList", [
      PlainContent("multilinePlain")..add(TextContent('multilineText', details))
    ]));

    final d = await docx.generate(c);
    final directory = await getDownloadsDirectory();
    final file = File('${directory!.path}/generated.docx');
    if (d != null) {
      await file.writeAsBytes(d);
      OpenFile.open(file.path);
    }
  }
}
