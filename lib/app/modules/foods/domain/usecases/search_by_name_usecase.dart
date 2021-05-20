import 'package:dartz/dartz.dart';

import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/requests/basic_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/search_repository.dart';

abstract class ISearchByName {
  Future<Either<FailureFood, List<BasicFoodEntity>>> call(String searchName);
}

class SearchByNameUsecase implements ISearchByName {
  ISearchRepository repository;

  SearchByNameUsecase(this.repository);

  @override
  Future<Either<FailureFood, List<BasicFoodEntity>>> call(String searchName) {
    return repository.searchByName(searchName);
  }
}
