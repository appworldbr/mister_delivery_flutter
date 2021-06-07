import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/food_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/get_food_details_repository.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/get_food_details_datasource.dart';

class GetFoodDetailsRepositoryImplementation implements IGetFoodDetailsRepository {
  IGetFoodDetailsDatasource datasource;

  GetFoodDetailsRepositoryImplementation(this.datasource);

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
