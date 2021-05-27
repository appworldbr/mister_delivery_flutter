import 'dart:convert';

import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/entities/requests/basic_food_entity.dart';
import 'package:mister_delivery_flutter/app/modules/foods/domain/usecases/search_by_name_usecase.dart';
import 'package:mister_delivery_flutter/app/modules/foods/food_module.dart';
import 'package:mister_delivery_flutter/app/shared/custom_dio/native/custom_dio_native_module.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../config/config_module_test.mocks.dart';
import 'mocks/basic_foods_mock.dart';

@GenerateMocks([Dio])
main() {
  final mockDio = MockDio();

  initModules([
    CustomDioNativeModule(),
    FoodModule()
  ], replaceBinds: [
    Bind.instance<Dio>(mockDio),
  ]);

  test('should return a instance of SearchByNameUsecase get by ISearchByName',
      () {
    final usecase = Modular.get<ISearchByName>();
    expect(usecase, isA<SearchByNameUsecase>());
  });

  test('should return a list of BasicFoodEntity', () async {
    when(mockDio.get(any)).thenAnswer(
      (_) async => Response(
        data: jsonDecode(misterDeliveryBasicFoodMock),
        statusCode: 200,
        requestOptions: new RequestOptions(path: ''),
      ),
    );

    final usecase = Modular.get<ISearchByName>();
    final result = await usecase('');

    expect(result.fold(dartz.id, dartz.id), isA<List<BasicFoodEntity>>());
  });
}
