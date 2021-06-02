import 'dart:convert';

import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_extra_entity.dart';

class CartExtraModel extends CartExtraEntity {
  CartExtraModel({
    required int id,
    required int quantity,
  }) : super(
          id: id,
          quantity: quantity,
        );

  copyWith({int? id, int? quantity}) {
    return CartExtraModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }

  factory CartExtraModel.fromMap(Map<String, dynamic> map) {
    return CartExtraModel(
      id: map['id'],
      quantity: map['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartExtraModel.fromJson(String source) =>
      CartExtraModel.fromMap(json.decode(source));
}
