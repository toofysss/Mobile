import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:law/contant/config.dart';

class BlogClass {
  static Future getYourRightData() async {
    var respone = await http.get(
      Uri.parse("${ApiClass.api}/BlogControll/GetAll"),
      headers: const {"accept": "*/*"},
    );
    if (respone.statusCode == 200) {
      var responsebody = jsonDecode(respone.body);
      return responsebody;
    }
  }
}
