import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri_from_mobile.dart';

class GetUriModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
        (i) => GetUriFromMobile(
              base: 'http://localhost',
              api: 'http://localhost/api/v1.0',
            ),
        export: true),
    // Bind.singleton((i) => GetUriFromJavascript(), export: true),
    Bind.singleton((i) => GetUri(i()), export: true),
    Bind.singleton((i) => UriSingleton(), export: true),
  ];
}
