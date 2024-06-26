class PhysicStoreCoordinateData {
  PhysicStoreCoordinateData({this.latitude, this.longitude});

  PhysicStoreCoordinateData.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }
}
