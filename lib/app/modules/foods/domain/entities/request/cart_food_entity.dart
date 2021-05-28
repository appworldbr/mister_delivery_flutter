import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_extra_entity.dart';

class CartFoodEntity {
  final int id;
  final int quantity;
  final List<CartExtraEntity> extras;
  final String observation;

  CartFoodEntity({
    required this.id,
    required this.quantity,
    required this.extras,
    required this.observation,
  });
}
