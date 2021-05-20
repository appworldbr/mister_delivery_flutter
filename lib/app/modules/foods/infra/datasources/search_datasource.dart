import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/basic_food_model.dart';

abstract class ISearchDatasource {
  Future<List<BasicFoodModel>> search(String searchName);
}
