import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_food_response_entity.dart';

abstract class IGetCartDatasource {
  Future<List<CartFoodResponseEntity>> getCart();
}
