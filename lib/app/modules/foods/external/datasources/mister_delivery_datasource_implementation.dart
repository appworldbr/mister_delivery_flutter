import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/errors/errors.dart';

import 'package:mister_delivery_flutter/app/modules/foods/infra/datasources/search_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/foods/infra/models/basic_food_model.dart';

class MisterDeliveryDatasource implements ISearchDatasource {
  final Dio dio;

  MisterDeliveryDatasource(this.dio);

  @override
  Future<List<BasicFoodModel>> search(String searchName) async {
    Map<String, String> queryParams = {};

    if (searchName.isNotEmpty) {
      queryParams['q'] = searchName;
    }

    final response = await dio.get(
      Modular.get<UriSingleton>().uri + '/food',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    if (response.statusCode == 200) {
      final list = (response.data['food'] as List)
          .map((e) => BasicFoodModel.fromMap(e))
          .toList();

      return list;
    }

    throw FailureFoodDatasource();
  }
}
