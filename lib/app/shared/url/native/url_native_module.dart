import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/shared/url/models/url_model.dart';
import 'package:mister_delivery_flutter/app/shared/url/native/url_native.dart';

class UrlNativeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
      (i) => UrlModel(
        base: 'http://localhost',
        api: 'http://localhost/api/v1',
      ),
      export: true,
    ),
    Bind.singleton((i) => UrlNative(i()), export: true)
  ];
}
