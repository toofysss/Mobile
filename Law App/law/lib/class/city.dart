class CityData {
  int? id;
  String? dscrp;
  String? dscrpE;

  CityData({this.id, this.dscrp, this.dscrpE});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dscrp = json['dscrp'];
    dscrpE = json['dscrpE'];
  }
  static List<CityData> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => CityData.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dscrp'] = dscrp;
    data['dscrpE'] = dscrpE;
    return data;
  }
}
