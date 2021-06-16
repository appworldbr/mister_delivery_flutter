import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_extra_response_entity.dart';

class CartFoodResponseEntity {
  final int id;
  final String imageUrl;
  final String name;
  final num price;
  final String description;
  final bool hasDetails;
  final int quantity;
  final num total;
  final List<CartExtraResponseEntity> extras;
  final String observation;

  CartFoodResponseEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.hasDetails,
    required this.quantity,
    required this.total,
    required this.extras,
    required this.observation,
  });
}
