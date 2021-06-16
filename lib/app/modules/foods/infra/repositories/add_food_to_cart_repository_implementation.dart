import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_request_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/add_food_to_cart_repository.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/add_food_to_cart_datasource.dart';

class AddFoodToCartRepositoryImplementation extends IAddFoodToCartRepository {
  IAddFoodToCartDatasource datasource;

  AddFoodToCartRepositoryImplementation(this.datasource);

  @override
  Future<Either<FailureFood, bool>> addFoodToCart(CartFoodRequestEntity food) async {
    try {
      final result = await datasource.addFoodToCart(food);
      return Right(result);
    } catch (e) {
      return Left(FailureAddFoodToCart());
    }
  }
}
