class AnnouncingMoreRealEstateData {
  int? id;
  String? lawname;
  String? type;
  String? owners;
  String? space;
  String? address;
  String? price;
  String? date;
  String? dscrp;
  String? img;
  int? status;

  AnnouncingMoreRealEstateData(
      {this.id,
      this.lawname,
      this.type,
      this.owners,
      this.space,
      this.address,
      this.price,
      this.date,
      this.dscrp,
      this.img,
      this.status});

  AnnouncingMoreRealEstateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lawname = json['lawname'];
    type = json['type'];
    owners = json['owners'];
    space = json['space'];
    address = json['address'];
    price = json['price'];
    date = json['date'];
    dscrp = json['dscrp'];
    img = json['img'];
    status = json['status'];
  }
  static List<AnnouncingMoreRealEstateData> fromJsonList(
      List<dynamic> jsonList) {
    return jsonList
        .map((json) => AnnouncingMoreRealEstateData.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lawname'] = lawname;
    data['type'] = type;
    data['owners'] = owners;
    data['space'] = space;
    data['address'] = address;
    data['price'] = price;
    data['date'] = date;
    data['dscrp'] = dscrp;
    data['img'] = img;
    data['status'] = status;
    return data;
  }
}
