class GuideInfoModel {
  List<Almaqamat>? almaqamat;
  List<Almaraqid>? almaraqid;

  GuideInfoModel({this.almaqamat, this.almaraqid});

  GuideInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['Almaqamat'] != null) {
      almaqamat = <Almaqamat>[];
      json['Almaqamat'].forEach((v) {
        almaqamat!.add(Almaqamat.fromJson(v));
      });
    }
    if (json['Almaraqid'] != null) {
      almaraqid = <Almaraqid>[];
      json['Almaraqid'].forEach((v) {
        almaraqid!.add(Almaraqid.fromJson(v));
      });
    }
  }
}

class Almaqamat {
  String? nameA;
  String? nameE;
  double? lat;
  double? long;
  String? locA;
  String? locE;

  Almaqamat(
      {this.nameA, this.nameE, this.lat, this.long, this.locA, this.locE});

  Almaqamat.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
    lat = json['lat'];
    long = json['long'];
    locA = json['locA'];
    locE = json['locE'];
  }
}

class Almaraqid {
  String? nameA;
  String? nameE;
  double? lat;
  double? long;
  String? locA;
  String? locE;

  Almaraqid(
      {this.nameA, this.nameE, this.lat, this.long, this.locA, this.locE});

  Almaraqid.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
    lat = json['lat'];
    long = json['long'];
    locA = json['locA'];
    locE = json['locE'];
  }
}
