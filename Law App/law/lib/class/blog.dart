class BlogData {
  int? id;
  String? type;
  List<BlogDetailsData>? details;

  BlogData({this.id, this.type, this.details});

  BlogData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    if (json['details'] != null) {
      details = <BlogDetailsData>[];
      json['details'].forEach((v) {
        details!.add(BlogDetailsData.fromJson(v));
      });
    }
  }
  static List<BlogData> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => BlogData.fromJson(json)).toList();
  }


}

class BlogDetailsData {
  int? id;
  String? title;
  String? dscrp;
  String? img;
  String? date;

  BlogDetailsData({this.id, this.title, this.dscrp, this.img, this.date});

  BlogDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    dscrp = json['dscrp'];
    img = json['img'];
    date = json['date'];
  }

}
