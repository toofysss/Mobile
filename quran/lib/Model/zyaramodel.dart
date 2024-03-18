class ZyaraModel {
  List<ZyaraDays>? days;
  List<ZyaraAnbiaa>? anbiaa;

  ZyaraModel({this.days, this.anbiaa});

  ZyaraModel.fromJson(Map<String, dynamic> json) {
    if (json['Days'] != null) {
      days = <ZyaraDays>[];
      json['Days'].forEach((v) {
        days!.add(ZyaraDays.fromJson(v));
      });
    }
    if (json['Anbiaa'] != null) {
      anbiaa = <ZyaraAnbiaa>[];
      json['Anbiaa'].forEach((v) {
        anbiaa!.add(ZyaraAnbiaa.fromJson(v));
      });
    }
  }
}

class ZyaraDays {
  String? titleA;
  String? titleE;
  String? dscrpE;
  String? dscrpA;

  ZyaraDays({this.titleA, this.titleE, this.dscrpE, this.dscrpA});

  ZyaraDays.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpE = json['DscrpE'];
    dscrpA = json['DscrpA'];
  }
}

class ZyaraAnbiaa {
  String? titleA;
  String? titleE;
  String? dscrpE;
  String? dscrpA;

  ZyaraAnbiaa({this.titleA, this.titleE, this.dscrpE, this.dscrpA});

  ZyaraAnbiaa.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpE = json['DscrpE'];
    dscrpA = json['DscrpA'];
  }
}
