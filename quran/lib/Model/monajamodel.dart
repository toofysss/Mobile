class MonajaModel {
  List<Monaja>? monaja;

  MonajaModel({this.monaja});

  MonajaModel.fromJson(Map<String, dynamic> json) {
    if (json['Monaja'] != null) {
      monaja = <Monaja>[];
      json['Monaja'].forEach((v) {
        monaja!.add(Monaja.fromJson(v));
      });
    }
  }
}

class Monaja {
  String? titleA;
  String? titleE;
  String? nameA;
  String? nameE;

  Monaja({this.titleA, this.titleE, this.nameA, this.nameE});

  Monaja.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    nameA = json['NameA'];
    nameE = json['NameE'];
  }
}
