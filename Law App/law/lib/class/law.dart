// ignore_for_file: unnecessary_getters_setters

class LawsData {
  int? _id;
  String? _dscrp;
  List<LawDetails>? _details;

  LawsData({int? id, String? dscrp, List<LawDetails>? details}) {
    if (id != null) {
      _id = id;
    }
    if (dscrp != null) {
      _dscrp = dscrp;
    }
    if (details != null) {
      _details = details;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get dscrp => _dscrp;
  set dscrp(String? dscrp) => _dscrp = dscrp;
  List<LawDetails>? get details => _details;
  set details(List<LawDetails>? details) => _details = details;

  LawsData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dscrp = json['dscrp'];
    if (json['details'] != null) {
      _details = <LawDetails>[];
      json['details'].forEach((v) {
        _details!.add(LawDetails.fromJson(v));
      });
    }
  }
  static List<LawsData> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => LawsData.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['dscrp'] = _dscrp;
    return data;
  }
}

class LawDetails {
  int? _id;
  String? _dscrp;

  LawDetails({int? id, String? dscrp}) {
    if (id != null) {
      _id = id;
    }
    if (dscrp != null) {
      _dscrp = dscrp;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get dscrp => _dscrp;
  set dscrp(String? dscrp) => _dscrp = dscrp;

  LawDetails.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dscrp = json['dscrp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['dscrp'] = _dscrp;
    return data;
  }
}
