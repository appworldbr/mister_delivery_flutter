import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/requests/food_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/get_food_details_repository.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/get_food_details_datasource.dart';

class GetFoodDetailsImplementation implements IGetFoodDetailsRepository {
  IGetFoodDetailsDatasource datasource;

  GetFoodDetailsImplementation(this.datasource);

  @override
  Future<Either<FailureFood, FoodEntity>> getFood(int id) async {
    try {
      final result = await datasource.getFood(id);
      return Right(result);
    } catch (e) {
      return Left(FailureFoodDatasource());
    }
  }
}
