class LawsData {
  int? id;
  String? dscrp;
  List<LawDetails>? details;

  LawsData({int? id, String? dscrp, List<LawDetails>? details}) {
    id = id;
    dscrp = dscrp;
    details = details;
  }

  LawsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dscrp = json['dscrp'];
    if (json['details'] != null) {
      details = <LawDetails>[];
      json['details'].forEach((v) {
        details!.add(LawDetails.fromJson(v));
      });
    }
  }
  static List<LawsData> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => LawsData.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dscrp'] = dscrp;
    return data;
  }
}

class LawDetails {
  int? id;
  String? dscrp;

  LawDetails({int? id, String? dscrp}) {
    if (id != null) {
      id = id;
    }
    if (dscrp != null) {
      dscrp = dscrp;
    }
  }
  LawDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dscrp = json['dscrp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dscrp'] = dscrp;
    return data;
  }
}
