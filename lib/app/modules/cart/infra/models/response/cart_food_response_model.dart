import 'dart:convert';

import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_extra_response_entity.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_food_response_entity.dart';
import 'package:mister_delivery_flutter/app/modules/cart/infra/models/response/cart_extra_response_model.dart';

class CartFoodResponseModel extends CartFoodResponseEntity {
  CartFoodResponseModel({
    required int id,
    required String imageUrl,
    required String name,
    required num price,
    required String description,
    required bool hasDetails,
    required int quantity,
    required num total,
    required List<CartExtraResponseEntity> extras,
    required String observation,
  }) : super(
          id: id,
          imageUrl: imageUrl,
          name: name,
          price: price,
          description: description,
          hasDetails: hasDetails,
          quantity: quantity,
          total: total,
          extras: extras,
          observation: observation,
        );

  factory CartFoodResponseModel.empty() => CartFoodResponseModel(
        id: 0,
        imageUrl: '',
        name: '',
        price: 0,
        description: '',
        hasDetails: false,
        total: 0,
        quantity: 0,
        extras: [],
        observation: '',
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'description': description,
      'hasDetails': hasDetails,
      'quantity': quantity,
      'total': total,
      'extras':
          extras.map((x) => (x as CartExtraResponseModel).toMap()).toList(),
      'observation': observation,
    };
  }

  factory CartFoodResponseModel.fromMap(Map<String, dynamic> map) {
    return CartFoodResponseModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      price: map['price'],
      description: map['description'],
      hasDetails: map['hasDetails'],
      quantity: map['quantity'],
      total: map['total'],
      extras: List<CartExtraResponseEntity>.from(
          map['extras']?.map((x) => CartExtraResponseModel.fromMap(x))),
      observation: map['observation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartFoodResponseModel.fromJson(String source) =>
      CartFoodResponseModel.fromMap(json.decode(source));
}
