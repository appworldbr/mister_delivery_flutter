import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_food_request_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/cart_food_model.dart';

class CartStore extends NotifierStore<FailureFood, CartFoodRequestEntity> {
  CartStore() : super(CartFoodModel.empty());

  setId(int id) {
    update((state as CartFoodModel).copyWith(id: id));
  }

  incrementQuantity() {
    update((state as CartFoodModel).copyWith(quantity: state.quantity + 1));
  }

  decrementQuantity() {
    if (state.quantity > 1) {
      update((state as CartFoodModel).copyWith(quantity: state.quantity - 1));
    }
  }
}
