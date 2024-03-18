class Goverment {
  List<Data>? data;

  Goverment({this.data});

  Goverment.fromJson(Map<String, dynamic> json) {
    data = <Data>[];
    json['data'].forEach((v) {
      data!.add(Data.fromJson(v));
    });
  }
}

class Data {
  int? id;
  String? cityA;
  String? cityE;

  Data({this.id, this.cityA, this.cityE});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityA = json['cityA'];
    cityE = json['cityE'];
  }
}
