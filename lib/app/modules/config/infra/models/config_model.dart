import 'dart:convert';

import 'package:mister_delivery_flutter/app/modules/config/domain/entities/config_entity.dart';

class ConfigModel extends ConfigEntity {
  ConfigModel({
    required String logo,
    required String name,
    required String description,
    required String address,
  }) : super(
          logo: logo,
          name: name,
          description: description,
          address: address,
        );

  Map<String, dynamic> toMap() {
    return {
      'logo': logo,
      'name': name,
      'description': description,
      'address': address,
    };
  }

  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      logo: map['logo'],
      name: map['name'],
      description: map['description'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigModel.fromJson(String source) =>
      ConfigModel.fromMap(json.decode(source));
}
