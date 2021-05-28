import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/add_food_to_cart_repository.dart';

abstract class IAddFoodToCart {
  Future<Either<FailureFood, bool>> call(CartFoodEntity food);
}

class AddFoodToCartUsecase extends IAddFoodToCart {
  IAddFoodToCartRepository repository;

  AddFoodToCartUsecase(this.repository);

  @override
  Future<Either<FailureFood, bool>> call(CartFoodEntity food) async {
    return repository.addFoodToCart(food);
  }
}
