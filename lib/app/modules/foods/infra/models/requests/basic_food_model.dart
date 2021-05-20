import 'dart:convert';

import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/requests/basic_food_entity.dart';

class BasicFoodModel extends BasicFoodEntity {
  BasicFoodModel({
    required id,
    required imageUrl,
    required name,
    required price,
    required description,
    required hasDetails,
  }) : super(
          id: id,
          imageUrl: imageUrl,
          name: name,
          price: price,
          description: description,
          hasDetails: hasDetails,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'description': description,
      'hasDetails': hasDetails,
    };
  }

  factory BasicFoodModel.fromMap(Map<String, dynamic> map) {
    return BasicFoodModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      price: map['price'],
      description: map['description'],
      hasDetails: map['hasDetails'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BasicFoodModel.fromJson(String source) =>
      BasicFoodModel.fromMap(json.decode(source));
}
