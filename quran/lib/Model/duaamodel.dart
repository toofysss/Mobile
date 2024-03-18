class DuaaModel {
  List<Days>? days;
  List<DuaaQuran>? duaaQuran;
  List<Duaa>? duaa;

  DuaaModel({
    this.days,
    this.duaaQuran,
    this.duaa,
  });

  DuaaModel.fromJson(Map<String, dynamic> json) {
    days = List<Days>.from(json['Days']?.map((x) => Days.fromJson(x)) ?? []);
    duaaQuran = List<DuaaQuran>.from(
        json['DuaaQuran']?.map((x) => DuaaQuran.fromJson(x)) ?? []);
    duaa = List<Duaa>.from(json['Duaa']?.map((x) => Duaa.fromJson(x)) ?? []);
  }
}

class Days {
  String? titleA;
  String? dscrpA;
  String? titleE;
  String? dscrpE;

  Days({
    this.titleA,
    this.dscrpA,
    this.titleE,
    this.dscrpE,
  });

  factory Days.fromJson(Map<String, dynamic> json) {
    return Days(
      titleA: json['TitleA'],
      dscrpA: json['DscrpA'],
      titleE: json['TitleE'],
      dscrpE: json['DscrpE'],
    );
  }
}

class Duaa {
  String? title;
  String? dscrp;

  Duaa({this.title, this.dscrp});

  factory Duaa.fromJson(Map<String, dynamic> json) {
    return Duaa(
      title: json['Title'],
      dscrp: json['Dscrp'],
    );
  }
}

class DuaaQuran {
  String? titleA;
  String? dscrpA;
  String? titleE;
  String? dscrpE;
  DuaaQuran({
    this.titleA,
    this.dscrpA,
    this.titleE,
    this.dscrpE,
  });

  factory DuaaQuran.fromJson(Map<String, dynamic> json) {
    return DuaaQuran(
      titleA: json['TitleA'],
      dscrpA: json['DscrpA'],
      titleE: json['TitleE'],
      dscrpE: json['DscrpE'],
    );
  }
}
