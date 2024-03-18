class BooksDataClass {
  int? id;
  String? dscrp;
  String? files;

  BooksDataClass({this.id, this.dscrp, this.files});

  BooksDataClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dscrp = json['dscrp'];
    files = json['files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dscrp'] = dscrp;
    data['files'] = files;
    return data;
  }

  static List<BooksDataClass> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BooksDataClass.fromJson(json)).toList();
  }
}
