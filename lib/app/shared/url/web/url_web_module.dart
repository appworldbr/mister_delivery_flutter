import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/shared/url/web/url_web.dart';

class UrlWebModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => UrlWeb(), export: true),
  ];
}
