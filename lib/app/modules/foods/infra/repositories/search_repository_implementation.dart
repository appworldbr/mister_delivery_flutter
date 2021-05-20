import 'package:dartz/dartz.dart';

import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/requests/basic_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/repositories/search_repository.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/search_datasource.dart';

class SearchRepositoryImplementation implements ISearchRepository {
  ISearchDatasource datasource;

  SearchRepositoryImplementation(this.datasource);

  @override
  Future<Either<FailureFood, List<BasicFoodEntity>>> searchByName(
      String searchName) async {
    try {
      final result = await datasource.search(searchName);
      return Right(result);
    } catch (e) {
      return Left(FailureFoodDatasource());
    }
  }
}
