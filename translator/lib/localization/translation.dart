import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class MyTransition extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "App": "المترجم",
          "Hello": "مرحبا ",
          "Name": "انا لورين",
          "Title": "جسر اللغة الخاص بك",
          "Subtitle": "دعونا نستكشف العالم بلغات مختلفة معًا",
        },
        "en": {
          "App": "Translator",
          "Hello": "Hello ",
          "Name": "I'm Lauren",
          "Title": "Your Language Bridge",
          "Subtitle": "let's Explore The World In Different Language Together",
        }
      };
}
