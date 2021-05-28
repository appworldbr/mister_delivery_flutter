// ignore: avoid_web_libraries_in_flutter
import 'dart:js';
import 'package:mister_delivery_flutter/app/shared/url/models/url_model.dart';
import 'package:mister_delivery_flutter/app/shared/url/models/url_singleton.dart';

class UrlWeb {
  UrlWeb() {
    final url = UrlModel.fromJson(context['JSON'].callMethod(
      'stringify',
      [context['uriConfiguration']],
    ));
    final singleton = UrlSingleton();
    singleton.api = url.api;
    singleton.domain = url.domain;
  }
}
