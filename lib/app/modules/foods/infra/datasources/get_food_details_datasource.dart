import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/food_model.dart';

abstract class IGetFoodDetailsDatasource {
  Future<FoodModel> getFood(int id);
}
