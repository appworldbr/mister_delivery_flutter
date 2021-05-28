import 'package:dartz/dartz.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/basic_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';

abstract class ISearchRepository {
  Future<Either<FailureFood, List<BasicFoodEntity>>> searchByName(
      String searchName);
}
