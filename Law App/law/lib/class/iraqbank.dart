class IraqBankData {
  int? id;
  String? title;
  List<IraqBankDataClass>? details;

  IraqBankData({this.id, this.title, this.details});

  IraqBankData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['dscrp'];
    if (json['details'] != null) {
      details = <IraqBankDataClass>[];
      json['details'].forEach((v) {
        details!.add(IraqBankDataClass.fromJson(v));
      });
    }
  }
  static List<IraqBankData> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => IraqBankData.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dscrp'] = title;
    return data;
  }
}

class IraqBankDataClass {
  int? id;
  String? title;
  String? dscrp;
  String? files;
  String? img;
  int? decisionsCourtCassationID;

  IraqBankDataClass(
      {this.id,
      this.title,
      this.dscrp,
      this.files,
      this.decisionsCourtCassationID,
      this.img});

  IraqBankDataClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    decisionsCourtCassationID = json['decisionsCourtCassationID'];
    title = json['title'];
    dscrp = json['dscrp'];
    files = json['files'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['dscrp'] = dscrp;
    data['files'] = files;
    data['img'] = img;
    return data;
  }
}
