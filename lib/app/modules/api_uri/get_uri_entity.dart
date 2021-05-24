import 'dart:convert';

class GetUriEntity {
  String? base;
  String? api;
  GetUriEntity({this.api, this.base});

  Map<String, dynamic> toMap() {
    return {
      'base': base,
      'api': api,
    };
  }

  factory GetUriEntity.fromMap(Map<String, dynamic> map) {
    return GetUriEntity(
      base: map['base'],
      api: map['api'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GetUriEntity.fromJson(String source) =>
      GetUriEntity.fromMap(json.decode(source));
}
