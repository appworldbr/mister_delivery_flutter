import 'package:mister_delivery_flutter/app/modules/api_uri/get_uri_entity.dart';

class GetUri {
  GetUriEntity getUriModel;
  GetUri(this.getUriModel) {
    UriSingleton()._api = getUriModel.api ?? '';
    UriSingleton()._base = getUriModel.base ?? '';
  }
}

class UriSingleton {
  static UriSingleton _singleton = UriSingleton._internal();

  factory UriSingleton() {
    return _singleton;
  }

  UriSingleton._internal();

  String _api = '';
  String _base = '';

  String get api => _api;
  String get base => _base;
}
