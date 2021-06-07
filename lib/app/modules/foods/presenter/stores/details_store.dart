import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/add_food_to_cart_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/get_food_details_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/cart_food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/cart_store.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/extra_store.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/price_store.dart';

class DetailsStore extends NotifierStore<FailureFood, FoodEntity> {
  final GetFoodDetailsUsecase getFoodDetailsUsecase;
  final AddFoodToCartUsecase addFoodToCartUsecase;

  final CartStore cartStore = CartStore();
  final ExtraStore extraStore = ExtraStore();
  final PriceStore priceStore = PriceStore();

  final TextEditingController observationController = TextEditingController();

  DetailsStore(
    this.getFoodDetailsUsecase,
    this.addFoodToCartUsecase,
  ) : super(FoodModel.empty());

  fetchTheFoodDetails(int id) async {
    setLoading(true);
    final result = await this.getFoodDetailsUsecase(id);
    result.fold(setError, (food) {
      cartStore.setId(food.id);
      food.extras.forEach((_extra) {
        extraStore.add(_extra);
      });
      update(food);
      updatePrice();
    });
    setLoading(false);
  }

  updatePrice() {
    final extraTotal = _calculateExtrasPrice();
    final foodTotal = (state.price + extraTotal) * cartStore.state.quantity;
    priceStore.update(foodTotal);
  }

  _calculateExtrasPrice() {
    final extrasWithQuantity = extraStore.state.where(
      (cartExtra) => cartExtra.quantity > 0,
    );
    final List<num> extraPrices = [0];
    extrasWithQuantity.forEach((cartExtra) {
      final extraPrice = state.extras
          .firstWhere(
            (extra) => extra.id == cartExtra.id,
          )
          .price;
      extraPrices.add(extraPrice * cartExtra.quantity);
    });

    return extraPrices.reduce((value, element) => value + element);
  }

  addToCart() async {
    final foodToCart = (cartStore.state as CartFoodModel).copyWith(
      extras: extraStore.state.where((extra) => extra.quantity > 0).toList(),
      observation: observationController.text,
    );
    await addFoodToCartUsecase(foodToCart);
    //TODO redirect to cart or show message
  }
}
