import 'package:dio/dio.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/entities/response/cart_food_response_entity.dart';
import 'package:mister_delivery_flutter/app/modules/cart/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/cart/infra/datasource/get_cart_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/cart/infra/models/response/cart_extra_response_model.dart';
import 'package:mister_delivery_flutter/app/modules/cart/infra/models/response/cart_food_response_model.dart';
import 'package:mister_delivery_flutter/app/shared/url/models/url_singleton.dart';

class MisterDeliveryDatasource implements IGetCartDatasource {
  final Dio dio;

  MisterDeliveryDatasource(this.dio);

  @override
  Future<List<CartFoodResponseEntity>> getCart() async {
    final response = await dio.get(
      UrlSingleton().api + '/cart',
    );

    if (response.statusCode == 200) {
      final cartFoodList = (response.data['food'] as List)
          .map(
            (cartFood) => CartFoodResponseModel(
              id: cartFood['id'],
              imageUrl: cartFood['food']['imageUrl'],
              name: cartFood['food']['name'],
              price: cartFood['food']['price'],
              description: cartFood['food']['description'],
              hasDetails: cartFood['food']['hasDetails'],
              quantity: cartFood['quantity'],
              total: cartFood['total'],
              extras: (cartFood['extras'] as List)
                  .map(
                    (cartExtra) => CartExtraResponseModel(
                      id: cartExtra['extra']['id'],
                      name: cartExtra['extra']['name'],
                      price: cartExtra['extra']['price'],
                      limit: cartExtra['extra']['limit'],
                      quantity: cartExtra['quantity'],
                    ),
                  )
                  .toList(),
              observation: cartFood['observation'],
            ),
          )
          .toList();
      return cartFoodList;
    }

    throw FailureCartDatasource();
  }
}
