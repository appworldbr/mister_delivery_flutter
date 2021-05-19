import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';

abstract class IGetFoodDetailsRepository {
  Future<Either<FailureFood, FoodEntity>> getFood(int id);
}
