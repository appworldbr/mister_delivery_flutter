import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/shared/custom_dio/native/custom_dio_native.dart';

class CustomDioNativeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => BaseOptions(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        followRedirects: false,
      ),
      export: true,
    ),
    Bind.singleton<Dio>((i) => CustomDioNative(i()), export: true)
  ];
}
