class DiscriminatoryregulationsData {
  int? id;
  String? dscrp;
  List<DiscriminatoryregulationsDetails>? details;

  DiscriminatoryregulationsData({this.id, this.dscrp, this.details});

  DiscriminatoryregulationsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dscrp = json['dscrp'];
    if (json['details'] != null) {
      details = <DiscriminatoryregulationsDetails>[];
      json['details'].forEach((v) {
        details!.add(DiscriminatoryregulationsDetails.fromJson(v));
      });
    }
  }
  static List<DiscriminatoryregulationsData> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DiscriminatoryregulationsData.fromJson(json)).toList();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dscrp'] = dscrp;
    return data;
  }
}

class DiscriminatoryregulationsDetails {
  int? id;
  String? title;
  String? details;
  int? discriminatoryregulationsID;

  DiscriminatoryregulationsDetails(
      {this.id, this.title, this.details, this.discriminatoryregulationsID});

  DiscriminatoryregulationsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    discriminatoryregulationsID = json['discriminatoryregulationsID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['details'] = details;
    data['discriminatoryregulationsID'] = discriminatoryregulationsID;
    return data;
  }
}
