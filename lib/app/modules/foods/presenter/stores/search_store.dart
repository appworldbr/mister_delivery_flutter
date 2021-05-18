import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/basic_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/search_by_name_usecase.dart';

class SearchStore extends NotifierStore<FailureFood, List<BasicFoodEntity>> {
  final SearchByNameUsecase usecase;

  SearchStore(this.usecase) : super([]) {
    this.getListByName('');
  }

  getListByName(String name) async {
    executeEither(() => usecase(name), delay: Duration(milliseconds: 500));
  }
}
