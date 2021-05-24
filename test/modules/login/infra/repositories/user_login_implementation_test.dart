import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mister_delivery_flutter/app/modules/login/domain/errors/errors.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/models/request/user_login_model.dart';
import 'package:mister_delivery_flutter/app/modules/login/infra/repositories/user_login_implementation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_login_implementation_test.mocks.dart';

@GenerateMocks([UserLoginModel, ILoginDatasource])
main() {
  final datasource = MockILoginDatasource();
  final repository = UserLoginImplementation(datasource);

  test('should return true', () async {
    when(datasource.login(any)).thenAnswer((_) async => true);
    final result = await repository.login(MockUserLoginModel());
    expect(result.fold(id, id), isA<bool>());
  });

  test('should return FailureLoginDatasource if datasource fails', () async {
    when(datasource.login(any)).thenThrow(Exception());
    final result = await repository.login(MockUserLoginModel());
    expect(result.fold(id, id), isA<FailureLoginDatasource>());
  });
}
