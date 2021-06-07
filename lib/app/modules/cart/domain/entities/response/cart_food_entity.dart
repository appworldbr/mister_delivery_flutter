import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_extra_entity.dart';

class CartFoodEntity {
  final int id;
  final String imageUrl;
  final String name;
  final num price;
  final String description;
  final bool hasDetails;
  final int quantity;
  final num total;
  final List<CartExtraEntity> extras;

  CartFoodEntity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.hasDetails,
    required this.quantity,
    required this.total,
    required this.extras,
  });
}
