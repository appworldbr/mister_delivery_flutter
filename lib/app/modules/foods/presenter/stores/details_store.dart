import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/get_food_details_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/extra_store.dart';

// class DetailsStoreState {
//   FoodEntity food;

//   DetailsStoreState({
//     required this.food,
//   });
// }

class DetailsStore extends NotifierStore<FailureFood, FoodEntity> {
  final GetFoodDetailsUsecase usecase;
  final ExtraStore extraStore = ExtraStore();

  DetailsStore(this.usecase) : super(FoodModel.empty());
  
  fetchTheFoodDetails(int id) async {
    setLoading(true);
    final result = await this.usecase(id);
    result.fold(setError, (food) {
      food.extras.forEach((_extra) {
        extraStore.add(_extra);
      });
      update(food);
    });
    setLoading(false);
  }
}
