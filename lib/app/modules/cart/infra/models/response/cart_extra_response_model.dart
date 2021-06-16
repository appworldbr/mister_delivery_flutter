import 'dart:convert';

import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_extra_response_entity.dart';

class CartExtraResponseModel extends CartExtraResponseEntity {
  CartExtraResponseModel({
    required int id,
    required String name,
    required num price,
    required int limit,
    required int quantity,
  }) : super(
          id: id,
          name: name,
          price: price,
          limit: limit,
          quantity: quantity,
        );

  factory CartExtraResponseModel.empty() => CartExtraResponseModel(
        id: 0,
        name: '',
        price: 0,
        limit: 0,
        quantity: 0,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'limit': limit,
      'quantity': quantity,
    };
  }

  factory CartExtraResponseModel.fromMap(Map<String, dynamic> map) {
    return CartExtraResponseModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      limit: map['limit'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartExtraResponseModel.fromJson(String source) =>
      CartExtraResponseModel.fromMap(json.decode(source));
}
