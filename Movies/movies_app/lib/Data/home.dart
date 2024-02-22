import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/Data/api.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeClass {

  static urllauncher(String url) async {
    await launchUrl(Uri.parse(url));
  }

  static Future details(String id, String type) async {
    final Uri dataUri =
        Uri.parse('${Api.apiMovie}/$type/$id?api_key=${Api.apikey}');
    final Uri video =
        Uri.parse('${Api.apiMovie}/$type/$id/videos?api_key=${Api.apikey}');
    final dataUriResponse = await http.get(dataUri);
    final videoResponse = await http.get(video);

    if (dataUriResponse.statusCode == 200 && videoResponse.statusCode == 200) {
      var dataBody = jsonDecode(dataUriResponse.body);
      var videolist = jsonDecode(videoResponse.body);

      return {
        'Data': dataBody,
        'video': videolist,
      };
    }
  }

  static Future getDate(String search) async {
    final Uri uri = Uri.parse('${Api.apiMovie}$search');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    }
  }
}
