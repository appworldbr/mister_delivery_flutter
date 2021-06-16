import 'package:flutter_triple/flutter_triple.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/request/cart_extra_request_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/response/extra_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/requests/cart_extra_model.dart';

class ExtraStore extends NotifierStore<FailureFood, List<CartExtraRequestEntity>> {
  ExtraStore() : super([]);

  add(ExtraEntity extra) {
    final newList = List<CartExtraRequestEntity>.from(state);
    newList.add(CartExtraModel(id: extra.id, quantity: 0));
    update(newList);
  }

  toggleExtra(bool? value, extra) {
    final newList = List<CartExtraRequestEntity>.from(state);
    final index = newList.indexWhere((_extra) => _extra.id == extra.id);
    final extra$ = newList[index];
    newList[index] =
        (extra$ as CartExtraModel).copyWith(quantity: value == true ? 1 : 0);
    update(newList);
  }

  incrementQuantity(ExtraEntity extra) {
    final newList = List<CartExtraRequestEntity>.from(state);
    final index = newList.indexWhere((_extra) => _extra.id == extra.id);
    final extra$ = newList[index];
    if (extra$.quantity < extra.limit) {
      newList[index] =
          (extra$ as CartExtraModel).copyWith(quantity: extra$.quantity + 1);
    }
    update(newList);
  }

  decrementQuantity(ExtraEntity extra) {
    final newList = List<CartExtraRequestEntity>.from(state);
    final index = newList.indexWhere((_extra) => _extra.id == extra.id);
    final extra$ = newList[index];
    if (extra$.quantity > 0) {
      newList[index] =
          (extra$ as CartExtraModel).copyWith(quantity: extra$.quantity - 1);
    }
    update(newList);
  }
}
