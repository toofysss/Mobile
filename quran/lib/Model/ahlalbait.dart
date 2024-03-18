class AhlAlbaitModel {
  List<AhlAlBayt>? ahlAlBayt;
  List<Maswomen>? maswomen;

  AhlAlbaitModel({this.ahlAlBayt, this.maswomen});

  AhlAlbaitModel.fromJson(Map<String, dynamic> json) {
    if (json['Ahl_alBayt'] != null) {
      ahlAlBayt = <AhlAlBayt>[];
      json['Ahl_alBayt'].forEach((v) {
        ahlAlBayt!.add(AhlAlBayt.fromJson(v));
      });
    }
    if (json['Maswomen'] != null) {
      maswomen = <Maswomen>[];
      json['Maswomen'].forEach((v) {
        maswomen!.add(Maswomen.fromJson(v));
      });
    }
  }
}

class AhlAlBayt {
  String? nameA;
  String? nameE;
  String? dateA;
  String? deadDateA;
  String? dateE;
  String? deadDateE;

  AhlAlBayt(
      {this.nameA,
      this.nameE,
      this.dateA,
      this.deadDateA,
      this.dateE,
      this.deadDateE});

  AhlAlBayt.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
    dateA = json['DateA'];
    deadDateA = json['DeadDateA'];
    dateE = json['DateE'];
    deadDateE = json['DeadDateE'];
  }
}

class Maswomen {
  String? nameA;
  String? nameE;
  String? dateA;
  String? deadDateA;
  String? dateE;
  String? deadDateE;

  Maswomen(
      {this.nameA,
      this.nameE,
      this.dateA,
      this.deadDateA,
      this.dateE,
      this.deadDateE});

  Maswomen.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
    dateA = json['DateA'];
    deadDateA = json['DeadDateA'];
    dateE = json['DateE'];
    deadDateE = json['DeadDateE'];
  }
}
