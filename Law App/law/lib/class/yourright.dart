class YourRightDataClass {
  int? id;
  String? title;
  List<Details>? details;

  YourRightDataClass({this.id, this.title, this.details});

  YourRightDataClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['dscrp'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  static List<YourRightDataClass> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => YourRightDataClass.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dscrp'] = title;
    return data;
  }
}

class Details {
  int? id;
  String? question;
  String? answer;
  String? laws;

  Details({this.id, this.question, this.answer, this.laws});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['qusetion'];
    answer = json['answer'];
    laws = json['laws'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['qusetion'] = question;
    data['answer'] = answer;
    data['laws'] = laws;
    return data;
  }
}