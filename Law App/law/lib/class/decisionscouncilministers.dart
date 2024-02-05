class DecisionsClass {
  int? id;
  String? dscrp;

  DecisionsClass({this.id, this.dscrp});

  DecisionsClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dscrp = json['dscrp'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dscrp'] = dscrp;
    return data;
  }

  static List<DecisionsClass> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DecisionsClass.fromJson(json)).toList();
  }
}
