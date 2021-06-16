import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_extra_request_entity.dart';

class CartFoodRequestEntity {
  final int id;
  final int quantity;
  final List<CartExtraRequestEntity> extras;
  final String observation;

  CartFoodRequestEntity({
    required this.id,
    required this.quantity,
    required this.extras,
    required this.observation,
  });
}
