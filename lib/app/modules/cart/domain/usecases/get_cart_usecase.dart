import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/repositories/get_cart_repository.dart';

abstract class IGetCartUsecase {
  Future<Either<FailureCart, List<CartFoodEntity>>> call();
}

class GetCartUsecase implements IGetCartUsecase {
  final IGetCartRepository repository;

  GetCartUsecase(this.repository);

  @override
  Future<Either<FailureCart, List<CartFoodEntity>>> call() async {
    return await repository.getCart();
  }
}
