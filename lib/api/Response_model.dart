import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    this.value,
  });

  ResponseModel.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(v);
      });
    }
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }

  List<dynamic>? categories;
  String? createdAt;
  String? iconUrl;
  String? id;
  String? updatedAt;
  String? url;
  String? value;

  ResponseModel copyWith({
    List<dynamic>? categories,
    String? createdAt,
    String? iconUrl,
    String? id,
    String? updatedAt,
    String? url,
    String? value,
  }) =>
      ResponseModel(
        categories: categories ?? this.categories,
        createdAt: createdAt ?? this.createdAt,
        iconUrl: iconUrl ?? this.iconUrl,
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        url: url ?? this.url,
        value: value ?? this.value,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    map['created_at'] = createdAt;
    map['icon_url'] = iconUrl;
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['url'] = url;
    map['value'] = value;
    return map;
  }
}
