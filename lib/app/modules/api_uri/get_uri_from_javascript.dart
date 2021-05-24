// ignore: avoid_web_libraries_in_flutter
import 'dart:js';

import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri_entity.dart';

class GetUriFromJavascript extends GetUriEntity {
  String? base;
  String? api;

  GetUriFromJavascript() {
    final model = GetUriEntity.fromJson(context['JSON'].callMethod(
      'stringify',
      [context['uriConfiguration']],
    ));
    this.api = model.api;
    this.base = model.base;
  }
}
