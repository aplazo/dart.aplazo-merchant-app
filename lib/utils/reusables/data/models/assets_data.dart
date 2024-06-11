class AssetsData {
  AssetsData({this.image, this.logo, this.booster});

  AssetsData.fromJson(dynamic json) {
    image = json['image'];
    booster = json['boosterMobile'];
    logo = json['logo'];
  }

  AssetsData.fromJsonOld(dynamic json) {
    image = json['uri_image'];
    logo = '';
  }

  String? image;
  String? logo;
  String? booster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['boosterMobile'] = booster;
    map['logo'] = logo;
    return map;
  }
}
