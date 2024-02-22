class PrayerModel {
  List<Prayers>? prayer;

  PrayerModel({List<Prayers>? prayer}) {
    prayer = prayer;
  }

  PrayerModel.fromJson(Map<String, dynamic> json) {
    prayer = <Prayers>[];
    json['Prayer'].forEach((v) {
      prayer!.add(Prayers.fromJson(v));
    });
  }
}

class Prayers {
  String? titleA;
  String? titleE;
  String? dscrpE;
  String? dscrpA;

  Prayers({
    String? titleA,
    String? titleE,
    String? dscrpE,
    String? dscrpA,
  }) {
    titleA = titleA;
    titleE = titleE;
    dscrpE = dscrpE;
    dscrpA = dscrpA;
  }

  Prayers.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpE = json['DscrpE'];
    dscrpA = json['DscrpA'];
  }
}
