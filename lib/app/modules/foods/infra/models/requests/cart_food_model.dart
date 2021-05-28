import 'dart:convert';

import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/cart_extra_model.dart';

class CartFoodModel extends CartFoodEntity {
  CartFoodModel(
      {required int id,
      required int quantity,
      required List<CartExtraModel> extras,
      required String observation})
      : super(
          id: id,
          quantity: quantity,
          extras: extras,
          observation: observation,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantity': quantity,
      'extras': extras.map((x) => (x as CartExtraModel).toMap()).toList(),
      'observation': observation,
    };
  }

  factory CartFoodModel.fromMap(Map<String, dynamic> map) {
    return CartFoodModel(
      id: map['id'],
      quantity: map['quantity'],
      extras: List<CartExtraModel>.from(
          map['extras']?.map((x) => CartExtraModel.fromMap(x))),
      observation: map['observation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartFoodModel.fromJson(String source) =>
      CartFoodModel.fromMap(json.decode(source));
}
