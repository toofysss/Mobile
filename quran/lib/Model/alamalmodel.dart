class AlamalModel {
  List<Muharram>? muharram;
  List<Safar>? safar;
  List<RabiAlAwwal>? rabiAlAwwal;
  List<RabialAlthaani>? rabialAlthaani;
  List<JumadaAlAwwal>? jumadaAlAwwal;
  List<JumadaAlthanni>? jumadaAlthanni;
  List<Rajab>? rajab;
  List<Shaaban>? shaaban;
  List<Ramadhan>? ramadhan;
  List<Shawwal>? shawwal;
  List<DhulQadah>? dhulQadah;
  List<DhuAlHijjah>? dhuAlHijjah;

  AlamalModel(
      {this.muharram,
      this.safar,
      this.rabiAlAwwal,
      this.rabialAlthaani,
      this.jumadaAlAwwal,
      this.jumadaAlthanni,
      this.rajab,
      this.shaaban,
      this.ramadhan,
      this.shawwal,
      this.dhulQadah,
      this.dhuAlHijjah});

  AlamalModel.fromJson(Map<String, dynamic> json) {
    if (json['Muharram'] != null) {
      muharram = <Muharram>[];
      json['Muharram'].forEach((v) {
        muharram!.add(Muharram.fromJson(v));
      });
    }
    if (json['Safar'] != null) {
      safar = <Safar>[];
      json['Safar'].forEach((v) {
        safar!.add(Safar.fromJson(v));
      });
    }
    if (json['RabiAlAwwal'] != null) {
      rabiAlAwwal = <RabiAlAwwal>[];
      json['RabiAlAwwal'].forEach((v) {
        rabiAlAwwal!.add(RabiAlAwwal.fromJson(v));
      });
    }
    if (json['RabialAlthaani'] != null) {
      rabialAlthaani = <RabialAlthaani>[];
      json['RabialAlthaani'].forEach((v) {
        rabialAlthaani!.add(RabialAlthaani.fromJson(v));
      });
    }
    if (json['JumadaAlAwwal'] != null) {
      jumadaAlAwwal = <JumadaAlAwwal>[];
      json['JumadaAlAwwal'].forEach((v) {
        jumadaAlAwwal!.add(JumadaAlAwwal.fromJson(v));
      });
    }
    if (json['JumadaAlthanni'] != null) {
      jumadaAlthanni = <JumadaAlthanni>[];
      json['JumadaAlthanni'].forEach((v) {
        jumadaAlthanni!.add(JumadaAlthanni.fromJson(v));
      });
    }
    if (json['Rajab'] != null) {
      rajab = <Rajab>[];
      json['Rajab'].forEach((v) {
        rajab!.add(Rajab.fromJson(v));
      });
    }
    if (json['Shaaban'] != null) {
      shaaban = <Shaaban>[];
      json['Shaaban'].forEach((v) {
        shaaban!.add(Shaaban.fromJson(v));
      });
    }
    if (json['Ramadhan'] != null) {
      ramadhan = <Ramadhan>[];
      json['Ramadhan'].forEach((v) {
        ramadhan!.add(Ramadhan.fromJson(v));
      });
    }
    if (json['Shawwal'] != null) {
      shawwal = <Shawwal>[];
      json['Shawwal'].forEach((v) {
        shawwal!.add(Shawwal.fromJson(v));
      });
    }
    if (json['DhulQadah'] != null) {
      dhulQadah = <DhulQadah>[];
      json['DhulQadah'].forEach((v) {
        dhulQadah!.add(DhulQadah.fromJson(v));
      });
    }
    if (json['DhuAlHijjah'] != null) {
      dhuAlHijjah = <DhuAlHijjah>[];
      json['DhuAlHijjah'].forEach((v) {
        dhuAlHijjah!.add(DhuAlHijjah.fromJson(v));
      });
    }
  }
}

class Muharram {
  String? titleA;
  String? titleE;
  String? dscrpA;

  Muharram({this.titleA, this.titleE, this.dscrpA});

  Muharram.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class Safar {
  String? titleA;
  String? titleE;
  String? dscrpA;

  Safar({this.titleA, this.titleE, this.dscrpA});

  Safar.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class RabiAlAwwal {
  String? titleA;
  String? titleE;
  String? dscrpA;

  RabiAlAwwal({this.titleA, this.titleE, this.dscrpA});

  RabiAlAwwal.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class RabialAlthaani {
  String? titleA;
  String? titleE;
  String? dscrpA;

  RabialAlthaani({this.titleA, this.titleE, this.dscrpA});

  RabialAlthaani.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class JumadaAlAwwal {
  String? titleA;
  String? titleE;
  String? dscrpA;

  JumadaAlAwwal({this.titleA, this.titleE, this.dscrpA});

  JumadaAlAwwal.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class JumadaAlthanni {
  String? titleA;
  String? titleE;
  String? dscrpA;

  JumadaAlthanni({this.titleA, this.titleE, this.dscrpA});

  JumadaAlthanni.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class Rajab {
  String? titleA;
  String? titleE;
  String? dscrpA;

  Rajab({this.titleA, this.titleE, this.dscrpA});

  Rajab.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class Shaaban {
  String? titleA;
  String? titleE;
  String? dscrpA;

  Shaaban({this.titleA, this.titleE, this.dscrpA});

  Shaaban.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class Ramadhan {
  String? titleA;
  String? titleE;
  String? dscrpA;

  Ramadhan({this.titleA, this.titleE, this.dscrpA});

  Ramadhan.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class Shawwal {
  String? titleA;
  String? titleE;
  String? dscrpA;

  Shawwal({this.titleA, this.titleE, this.dscrpA});

  Shawwal.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class DhulQadah {
  String? titleA;
  String? titleE;
  String? dscrpA;

  DhulQadah({this.titleA, this.titleE, this.dscrpA});

  DhulQadah.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}

class DhuAlHijjah {
  String? titleA;
  String? titleE;
  String? dscrpA;

  DhuAlHijjah({this.titleA, this.titleE, this.dscrpA});

  DhuAlHijjah.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
    dscrpA = json['DscrpA'];
  }
}
