class SalaAnbiaaModel {
  List<SalaTAnbiaa>? salaTAnbiaa;

  SalaAnbiaaModel({this.salaTAnbiaa});

  SalaAnbiaaModel.fromJson(Map<String, dynamic> json) {
    if (json['SalaِtAnbiaa'] != null) {
      salaTAnbiaa = <SalaTAnbiaa>[];
      json['SalaِtAnbiaa'].forEach((v) {
        salaTAnbiaa!.add(SalaTAnbiaa.fromJson(v));
      });
    }
  }
}

class SalaTAnbiaa {
  String? titleA;
  String? titleE;
  String? dscrpE;
  String? dscrpA;

  SalaTAnbiaa({this.titleA, this.titleE, this.dscrpE, this.dscrpA});

  SalaTAnbiaa.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpE = json['DscrpE'];
    dscrpA = json['DscrpA'];
  }
}
