import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/errors/errors.dart';

abstract class IGetCartRepository {
  Future<Either<FailureCart, List<CartFoodEntity>>> getCart();
}
