import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/get_food_details_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/response/food_model.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/cart_store.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/extra_store.dart';
import 'package:mister_delivery_flutter/app/modules/foods/presenter/stores/price_store.dart';

class DetailsStore extends NotifierStore<FailureFood, FoodEntity> {
  final GetFoodDetailsUsecase usecase;

  final CartStore cartStore = CartStore();
  final ExtraStore extraStore = ExtraStore();
  final PriceStore priceStore = PriceStore();

  DetailsStore(this.usecase) : super(FoodModel.empty());

  fetchTheFoodDetails(int id) async {
    setLoading(true);
    final result = await this.usecase(id);
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
}
