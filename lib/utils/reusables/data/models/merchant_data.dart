import 'assets_data.dart';

class MerchantData {
  MerchantData({
    this.id,
    this.name,
    this.website,
    this.integrationType,
    this.channel,
    this.category,
    this.assets,
  });

  MerchantData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    website = json['website'];
    integrationType = json['integrationType'];
    channel = json['channel'];
    category = json['category'];
    assets =
        json['assets'] != null ? AssetsData.fromJson(json['assets']) : null;
  }
  MerchantData.fromJsonOld(dynamic json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    website = json['url'];
    integrationType = '';
    channel = json['channel'];
    category = '';
    assets = AssetsData.fromJsonOld(json);
  }
  int? id;
  String? name;
  String? website;
  String? integrationType;
  String? channel;
  String? category;
  AssetsData? assets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['website'] = website;
    map['integrationType'] = integrationType;
    map['channel'] = channel;
    map['category'] = category;
    if (assets != null) {
      map['assets'] = assets?.toJson();
    }
    return map;
  }
}
