import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/add_food_to_cart_repository.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/add_food_to_cart_datasource.dart';

class AddFoodToCartImplementation extends IAddFoodToCartRepository {
  IAddFoodToCartDatasource datasource;

  AddFoodToCartImplementation(this.datasource);

  @override
  Future<Either<FailureFood, bool>> addFoodToCart(CartFoodEntity food) async {
    try {
      final result = await datasource.addFoodToCart(food);
      return Right(result);
    } catch (e) {
      return Left(FailureAddFoodToCart());
    }
  }
}
