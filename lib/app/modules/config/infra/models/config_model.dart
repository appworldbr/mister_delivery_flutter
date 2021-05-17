import 'package:flutter/material.dart';
import 'package:mister_delivery_flutter/app/modules/config/domain/entities/config_entity.dart';

class ConfigModel extends ConfigEntity {
  ConfigModel({
    required String logo,
    required String name,
    required String description,
    required String address,
    required String color,
  }) : super(
            logo: logo,
            name: name,
            description: description,
            address: address,
            color: color);

  Map<String, dynamic> toMap() {
    return {
      'logo': logo,
      'name': name,
      'description': description,
      'address': address,
      'color': color,
    };
  }

  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      logo: map['logo'],
      name: map['name'],
      description: map['description'],
      address: map['address'],
      color: map['color'],
    );
  }
}

class ConfigSingleton {
  static ConfigSingleton _singleton = ConfigSingleton._internal();

  factory ConfigSingleton() {
    return _singleton;
  }

  ConfigSingleton._internal();

  Map<String, dynamic> configModel = ConfigModel(
    name: '',
    logo: '',
    description: '',
    color: 'blue',
    address: '',
  ).toMap();

  void set(String key, dynamic value) =>
      configModel.update(key, (dynamic) => value);

  void setConfigModel(ConfigModel newConfigModel) =>
      configModel = newConfigModel.toMap();

  dynamic get(String key) => configModel[key];

  ConfigModel getModel() => ConfigModel.fromMap(configModel);

  MaterialColor? getColor() {
    final availableColors = {
      "red": Colors.red,
      "pink": Colors.pink,
      "purple": Colors.purple,
      "deepPurple": Colors.deepPurple,
      "indigo": Colors.indigo,
      "blue": Colors.blue,
      "lightBlue": Colors.lightBlue,
      "cyan": Colors.cyan,
      "teal": Colors.teal,
      "green": Colors.green,
      "lightGreen": Colors.lightGreen,
      "lime": Colors.lime,
      "yellow": Colors.yellow,
      "amber": Colors.amber,
      "orange": Colors.orange,
      "deepOrange": Colors.deepOrange,
      "brown": Colors.brown,
    };

    return availableColors[configModel['color']] ?? availableColors['blue'];
  }
}
