// ignore: avoid_web_libraries_in_flutter
import 'dart:js';

import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri_entity.dart';

class GetUriFromJavascript extends GetUriEntity {
  String? uri;
  GetUriFromJavascript() {
    this.uri = context['uriConfiguration'];
  }
}
