import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';

abstract class IAddFoodToCartRepository {
  Future<Either<FailureFood, bool>> addFoodToCart(CartFoodEntity food);
}
