class LanguageData {
  List<LanguageCode>? languageCode;

  LanguageData({this.languageCode});

  LanguageData.fromJson(Map<String, dynamic> json) {
    if (json['LanguageCode'] != null) {
      languageCode = <LanguageCode>[];
      json['LanguageCode'].forEach((v) {
        languageCode!.add(LanguageCode.fromJson(v));
      });
    }
  }
}

class LanguageCode {
  String? code;
  String? lang;

  LanguageCode({this.code, this.lang});

  LanguageCode.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    lang = json['name'];
  }
}
