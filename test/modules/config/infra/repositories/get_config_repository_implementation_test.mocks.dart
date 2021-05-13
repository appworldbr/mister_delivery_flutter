// Mocks generated by Mockito 5.0.7 from annotations
// in mister_delivery_flutter/test/modules/config/infra/repositories/get_config_repository_implementation_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mister_delivery_flutter/app/modules/config/infra/datasources/get_config_datasource.dart'
    as _i3;
import 'package:mister_delivery_flutter/app/modules/config/infra/models/config_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeConfigModel extends _i1.Fake implements _i2.ConfigModel {}

/// A class which mocks [ConfigModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockConfigModel extends _i1.Mock implements _i2.ConfigModel {
  MockConfigModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get logo =>
      (super.noSuchMethod(Invocation.getter(#logo), returnValue: '') as String);
  @override
  String get name =>
      (super.noSuchMethod(Invocation.getter(#name), returnValue: '') as String);
  @override
  String get description =>
      (super.noSuchMethod(Invocation.getter(#description), returnValue: '')
          as String);
  @override
  String get address =>
      (super.noSuchMethod(Invocation.getter(#address), returnValue: '')
          as String);
  @override
  Map<String, dynamic> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  String toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []), returnValue: '')
          as String);
}

/// A class which mocks [IGetConfigDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGetConfigDatasource extends _i1.Mock
    implements _i3.IGetConfigDatasource {
  MockIGetConfigDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ConfigModel> getConfig() =>
      (super.noSuchMethod(Invocation.method(#getConfig, []),
              returnValue: Future<_i2.ConfigModel>.value(_FakeConfigModel()))
          as _i4.Future<_i2.ConfigModel>);
}
