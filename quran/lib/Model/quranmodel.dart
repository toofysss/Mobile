class QuranModel {
  List<Surah>? surah;
  List<Juz>? juz;

  QuranModel({this.surah, this.juz});

  QuranModel.fromJson(Map<String, dynamic> json) {
    if (json['Surah'] != null) {
      surah = <Surah>[];
      json['Surah'].forEach((v) {
        surah!.add(Surah.fromJson(v));
      });
    }
    if (json['Juz'] != null) {
      juz = <Juz>[];
      json['Juz'].forEach((v) {
        juz!.add(Juz.fromJson(v));
      });
    }
  }
}

class Surah {
  String? name;
  String? englishName;
  List<Ayahs>? ayahs;

  Surah({this.name, this.englishName, this.ayahs});

  Surah.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    englishName = json['englishName'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(Ayahs.fromJson(v));
      });
    }
  }
}

class Juz {
  String? juzA;
  String? juzE;
  List<Data>? data;

  Juz({this.juzA, this.juzE, this.data});

  Juz.fromJson(Map<String, dynamic> json) {
    juzA = json['JuzA'];
    juzE = json['JuzE'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? name;
  String? englishName;
  List<Ayahs>? ayahs;

  Data({this.name, this.englishName, this.ayahs});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    englishName = json['englishName'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(Ayahs.fromJson(v));
      });
    }
  }
}

class Ayahs {
  String? text;

  Ayahs({this.text});

  Ayahs.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }
}
