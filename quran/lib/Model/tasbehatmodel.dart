class TasbehatModel {
  List<Tasabeh>? tasabeh;
  List<TasabehAlzahra>? tasabehAlzahra;

  TasbehatModel({this.tasabeh, this.tasabehAlzahra});

  TasbehatModel.fromJson(Map<String, dynamic> json) {
    if (json['tasabeh'] != null) {
      tasabeh = <Tasabeh>[];
      json['tasabeh'].forEach((v) {
        tasabeh!.add(Tasabeh.fromJson(v));
      });
    }
    if (json['TasabehAlzahra'] != null) {
      tasabehAlzahra = <TasabehAlzahra>[];
      json['TasabehAlzahra'].forEach((v) {
        tasabehAlzahra!.add(TasabehAlzahra.fromJson(v));
      });
    }
  }
}

class Tasabeh {
  String? nameA;
  String? nameE;
  int? count;

  Tasabeh({this.nameA, this.nameE, this.count});

  Tasabeh.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
    count = json['Count'];
  }
}

class TasabehAlzahra {
  String? nameA;
  String? nameE;
  int? count;

  TasabehAlzahra({this.nameA, this.nameE, this.count});

  TasabehAlzahra.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
    count = json['Count'];
  }
}
