import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri_entity.dart';

class GetUri {
  GetUriEntity getUriModel;
  GetUri(this.getUriModel) {
    UriSingleton()._uri = getUriModel.uri ?? '';
  }
}

class UriSingleton {
  static UriSingleton _singleton = UriSingleton._internal();

  factory UriSingleton() {
    return _singleton;
  }

  UriSingleton._internal();

  String _uri = '';

  String get uri => _uri;
}
