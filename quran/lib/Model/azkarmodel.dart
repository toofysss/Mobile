class AzkarModel {
  List<Morning>? morning;
  List<Evening>? evening;
  List<Sala>? sala;
  List<Sleep>? sleep;
  List<Wakeup>? wakeup;

  AzkarModel({this.morning, this.evening, this.sala, this.sleep, this.wakeup});

  AzkarModel.fromJson(Map<String, dynamic> json) {
    morning = <Morning>[];
    json['Morning'].forEach((v) {
      morning!.add(Morning.fromJson(v));
    });
    evening = <Evening>[];
    json['Evening'].forEach((v) {
      evening!.add(Evening.fromJson(v));
    });
    sala = <Sala>[];
    json['Sala'].forEach((v) {
      sala!.add(Sala.fromJson(v));
    });
    sleep = <Sleep>[];
    json['sleep'].forEach((v) {
      sleep!.add(Sleep.fromJson(v));
    });
    wakeup = <Wakeup>[];
    json['wakeup'].forEach((v) {
      wakeup!.add(Wakeup.fromJson(v));
    });
  }
}

class Morning {
  String? nameA;
  String? nameE;

  Morning({
    this.nameA,
    this.nameE,
  });

  Morning.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
  }
}

class Evening {
  String? nameA;
  String? nameE;

  Evening({this.nameA, this.nameE});

  Evening.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
  }
}

class Sala {
  String? nameA;
  String? nameE;

  Sala({
    this.nameA,
    this.nameE,
  });

  Sala.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
  }
}

class Sleep {
  String? nameA;
  String? nameE;

  Sleep({
    this.nameA,
    this.nameE,
  });

  Sleep.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
  }
}

class Wakeup {
  String? nameA;
  String? nameE;

  Wakeup({
    this.nameA,
    this.nameE,
  });

  Wakeup.fromJson(Map<String, dynamic> json) {
    nameA = json['NameA'];
    nameE = json['NameE'];
  }
}
