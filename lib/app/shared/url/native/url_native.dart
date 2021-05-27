import 'package:flutter_modular/flutter_modular.dart';
import 'package:mister_delivery_flutter/app/shared/url/entities/url_entity.dart';
import 'package:mister_delivery_flutter/app/shared/url/models/url_singleton.dart';

class UrlNative {
  UrlEntity url;
  UrlNative(this.url) {
    final singleton = UrlSingleton();
    singleton.api = url.api;
    singleton.base = url.base;
  }
}
