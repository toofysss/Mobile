class AllahNameModel {
  List<AlaahName>? alaahName;

  AllahNameModel({List<AlaahName>? alaahName}) {
    if (alaahName != null) {
      alaahName = alaahName;
    }
  }

  AllahNameModel.fromJson(Map<String, dynamic> json) {
    alaahName = <AlaahName>[];
    json['AlaahName'].forEach((v) {
      alaahName!.add(AlaahName.fromJson(v));
    });
  }
}

class AlaahName {
  String? titleA;
  String? titleE;

  AlaahName({
    String? titleA,
    String? titleE,
  }) {
    titleA = titleA;
    titleE = titleE;
  }

  AlaahName.fromJson(Map<String, dynamic> json) {
    titleA = json['TitleA'];
    titleE = json['TitleE'];
  }
}
