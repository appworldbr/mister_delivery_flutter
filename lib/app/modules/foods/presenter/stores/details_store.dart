import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/get_food_details_usecase.dart';

class DetailsStoreState {
  FoodEntity? food;
}

class DetailsStore extends NotifierStore<FailureFood, DetailsStoreState> {
  final GetFoodDetailsUsecase usecase;

  DetailsStore(this.usecase) : super(DetailsStoreState());

  fetchTheFoodDetails(int id) async {
    final result = await this.usecase(id);
    result.fold(setError, (r) {
      state.food = r;
      update(state);
    });
  }
}
