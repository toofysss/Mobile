class ContractData {
  int? id;
  String? dscrp;
  String? details;

  ContractData({this.id, this.dscrp, this.details});

  ContractData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dscrp = json['dscrp'];
    details = json['details'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dscrp': dscrp,
      'details': details,
    };
  }

  static List<ContractData> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ContractData.fromJson(json)).toList();
  }
}
