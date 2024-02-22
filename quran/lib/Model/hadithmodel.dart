class HadithModel {
  List<Hadiths>? hadiths;

  HadithModel({List<Hadiths>? hadiths}) {
    hadiths = hadiths;
  }

  HadithModel.fromJson(Map<String, dynamic> json) {
    hadiths = <Hadiths>[];
    json['Hadiths'].forEach((v) {
      hadiths!.add(Hadiths.fromJson(v));
    });
  }
}

class Hadiths {
  String? dscrp;

  Hadiths({String? dscrp}) {
    dscrp = dscrp;
  }

  Hadiths.fromJson(Map<String, dynamic> json) {
    dscrp = json['Dscrp'];
  }
}
