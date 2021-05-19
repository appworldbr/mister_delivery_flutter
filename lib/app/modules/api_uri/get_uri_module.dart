import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri.dart';
import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri_from_mobile.dart';

class GetUriModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => GetUriFromMobile('http://delivery.local/api/v1.0'), export: true),
    // Bind.singleton((i) => GetUriFromJavascript(), export: true),
    Bind.lazySingleton((i) => GetUri(i()), export: true),
    Bind.lazySingleton((i) => UriSingleton(), export: true),
  ];
}
