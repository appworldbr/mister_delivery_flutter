import 'dart:convert';

import 'package:mister_delivery_flutter/app/shared/url/entities/url_entity.dart';

class UrlModel extends UrlEntity {
  String base;
  String api;
  UrlModel({required this.api, required this.base})
      : super(api: api, base: base);

  factory UrlModel.fromMap(Map<String, dynamic> map) {
    return UrlModel(
      base: map['base'],
      api: map['api'],
    );
  }

  factory UrlModel.fromJson(String source) =>
      UrlModel.fromMap(json.decode(source));
}
