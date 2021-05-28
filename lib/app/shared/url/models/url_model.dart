import 'dart:convert';

import 'package:mister_delivery_flutter/app/shared/url/entities/url_entity.dart';

class UrlModel extends UrlEntity {
  String domain;
  String api;
  UrlModel({required this.api, required this.domain})
      : super(api: api, domain: domain);

  factory UrlModel.fromMap(Map<String, dynamic> map) {
    return UrlModel(
      domain: map['domain'],
      api: map['api'],
    );
  }

  factory UrlModel.fromJson(String source) =>
      UrlModel.fromMap(json.decode(source));
}
