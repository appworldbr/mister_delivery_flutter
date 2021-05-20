import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/requests/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/get_food_details_repository.dart';

abstract class IGetFoodDetails {
  Future<Either<FailureFood, FoodEntity>> call(int id);
}

class GetFoodDetailsUsecase implements IGetFoodDetails {
  IGetFoodDetailsRepository repository;

  GetFoodDetailsUsecase(this.repository);

  @override
  Future<Either<FailureFood, FoodEntity>> call(int id) async {
    if (id < 1) {
      return Left(FailureFoodIdIncorrect());
    }

    return repository.getFood(id);
  }
}
