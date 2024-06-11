import 'merchant_data.dart';

class MerchantPageDataResponse {
  MerchantPageDataResponse({
    this.merchants,
    this.totalPages,
    this.totalElements,
    this.last,
    this.numberOfElements,
    this.first,
    this.sort,
    this.size,
    this.number,
    this.empty,
  });

  MerchantPageDataResponse.fromJson(dynamic json) {
    if (json['content'] != null) {
      merchants = [];
      json['content'].forEach((v) {
        merchants?.add(MerchantData.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    size = json['size'];
    number = json['number'];
    empty = json['empty'];
  }

  List<MerchantData>? merchants;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? numberOfElements;
  bool? first;
  List<dynamic>? sort;
  int? size;
  int? number;
  bool? empty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (merchants != null) {
      map['content'] = merchants?.map((v) => v.toJson()).toList();
    }
    map['totalPages'] = totalPages;
    map['totalElements'] = totalElements;
    map['last'] = last;
    map['numberOfElements'] = numberOfElements;
    map['first'] = first;
    if (sort != null) {
      map['sort'] = sort?.map((v) => v.toJson()).toList();
    }
    map['size'] = size;
    map['number'] = number;
    map['empty'] = empty;
    return map;
  }
}
